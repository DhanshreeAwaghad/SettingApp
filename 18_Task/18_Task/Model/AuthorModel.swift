//
//  AuthorModel.swift
//  27_API_Call
//
//  Created by Digitalflake Mahesh K on 27/03/24.
//

import Foundation

struct AuthorModel : Codable{
    let authors : [String]
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.authors, forKey: .authors)
    }
    enum CodingKeys: CodingKey {
        case authors
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authors = try container.decode([String].self, forKey: .authors)
    }
}

