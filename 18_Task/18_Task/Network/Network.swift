    //
    //  Network.swift
    //  27_API_Call
    //

import Foundation
import UIKit

    //Custom Api Error To manage Status Code -
protocol ConnectionManagerDelegate {
    func didFinishTask(data: Data?, error: Error?)
}

enum Endpoint: String {
    case employeeList = "employees"
    case user = "user"
}

class ConnectionManager {
    
    var delegate: ConnectionManagerDelegate?
    private let session = URLSession.shared
    private let baseURL = "https://dummyapi.io/data/v1/"
    
    
    init(delegate: ConnectionManagerDelegate? = nil) {
        self.delegate = delegate
        
    }
    
    func prepareForSession(endpoint: Endpoint,queryStr : String? = nil, queryParams: [String: String]? = nil) {
        if let query = queryParams{
            var urlString = baseURL + endpoint.rawValue
            if let queryParams = queryParams {
                urlString.append("?")
                for (key, value) in queryParams {
                    urlString.append("\(key)=\(value)&")
                }
                urlString.removeLast() // Remove the last '&' character
            }
            performTask(urlString)
        } else {
            if let queryStr = queryStr{
                var urlString = baseURL + endpoint.rawValue + queryStr
                if let queryParams = queryParams {
                    urlString.append("?")
                    for (key, value) in queryParams {
                        urlString.append("\(key)=\(value)&")
                    }
                    urlString.removeLast() // Remove the last '&' character
                }
                performTask(urlString)
                
            }
            else{
                var urlString = baseURL + endpoint.rawValue
                if let queryParams = queryParams {
                    urlString.append("?")
                    for (key, value) in queryParams {
                        urlString.append("\(key)=\(value)&")
                    }
                    urlString.removeLast() // Remove the last '&' character
                }
                performTask(urlString)
                
            }
        }
      
    }
    
    private func performTask(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        print("Hitting URL ------> \(url)")
        request.setValue("6603abd02626e811f5a4a775", forHTTPHeaderField: "app-id")
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let delegate = self.delegate else { return }
            delegate.didFinishTask(data: data, error: error)
        }
        task.resume()
    }
}

extension URL {
    
    func appending(_ queryItem: String, value: String?) -> URL {
        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ?? []
        let queryItem = URLQueryItem(name: queryItem, value: value)
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
//https://dummyapi.io/data/v1/user?limit=10
//https://dummyapi.io/data/v1/user/60d0fe4f5311236168a109ca
//https://dummyapi.io/data/v1/post?limit=10
//https://dummyapi.io/data/v1/user/60d0fe4f5311236168a109ca/post?limit=10
//https://dummyapi.io/data/v1/post/60d21af267d0d8992e610b8d/comment?limit=10
//https://dummyapi.io/data/v1/post/60d21af267d0d8992e610b8d/comment?limit=10
//https://dummyapi.io/data/v1/tag/water/post?limit=10
