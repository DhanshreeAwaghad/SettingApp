//
//  ImageDownloadManager.swift
//  GoodSpaceApp
//
//  Created by Bharat Shilavat on 11/12/23.
//

import Foundation
import UIKit

//MARK: - Image Downloader -
class ImageDownloader {
    private static var activeDownloads: [URL: ImageDownloadOperation] = [:]
    private static let downloadQueue = OperationQueue()
    private static let synchronizationQueue = DispatchQueue(label: "com.yourapp.imagedownloader.synchronization")
    
    static func downloadImage(_ urlString: String, completion: @escaping (_ image: UIImage?, _ urlString: String?, _ error: Error?) -> ()) {
        // Checking the cache first
//        if let cachedImage = ImageCache.shared.getImage(for: urlString) {
//            DispatchQueue.main.async {
//                completion(cachedImage, urlString, nil)
//            }
//            return
//        }
//        
        guard let url = URL(string: urlString) else {
            completion(nil, urlString, ImageDownloadError.invalidURL)
            return
        }
        
        // Check if there is an active download for the URL, and cancel it if necessary
        synchronizationQueue.sync {
            if let existingDownload = activeDownloads[url] {
                existingDownload.cancel()
                activeDownloads[url] = nil
            }
        }
        
        let downloadOperation = ImageDownloadOperation(url: url) { (data, response, error) in
            defer {
                // Remove the operation from the active downloads after completion
                synchronizationQueue.sync {
                    activeDownloads[url] = nil
                }
            }
            
            if let error = error {
                completion(nil, urlString, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(nil, urlString, ImageDownloadError.invalidResponse)
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                // Cache the image
                ImageCache.shared.cacheImage(image, for: urlString)
                // Call the completion handler on the main thread
                DispatchQueue.main.async {
                    completion(image, urlString, nil)
                }
                return
            }
            
            completion(nil, urlString, ImageDownloadError.invalidData)
        }
        
        // Store the operation in the active downloads dictionary in a thread-safe manner
        synchronizationQueue.sync {
            activeDownloads[url] = downloadOperation
        }
        
        // Add the operation to the queue
        downloadQueue.addOperation(downloadOperation)
    }
    
    static func cancelDownload(for url: URL) {
        downloadQueue.addOperation {
            if let downloadOperation = activeDownloads[url] {
                downloadOperation.cancel()
                activeDownloads[url] = nil
            }
        }
    }
    static func cancelAllDownloads() {
        downloadQueue.cancelAllOperations()
        synchronizationQueue.sync {
            activeDownloads.removeAll()
        }
    }
}
class ImageDownloadOperation: Operation {
    private let url: URL
    private let completionHandler: (Data?, URLResponse?, Error?) -> Void
    
    init(url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.url = url
        self.completionHandler = completionHandler
        super.init()
    }
    
    override func main() {
        guard !isCancelled else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self, !self.isCancelled else { return }
            self.completionHandler(data, response, error)
        }.resume()
    }
}

// Error types for image download
enum ImageDownloadError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

//MARK: -  Simple image cache implementation -
class ImageCache {
    static let shared = ImageCache()
    private var cache: NSCache<NSString, UIImage>
    
    private init() {
        cache = NSCache()
        cache.countLimit = 50 // Adjust based on your app's requirements
    }
    
    func cacheImage(_ image: UIImage, for key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func getImage(for key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
}
