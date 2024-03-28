//
//  UserListModel.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 28/03/24.
//

import Foundation

struct UserListModel : Codable{
    let data: [UserData]?
    let total, page, limit: Int?
    
    enum CodingKeys: CodingKey {
        case data
        case total
        case page
        case limit
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.data, forKey: .data)
        try container.encodeIfPresent(self.total, forKey: .total)
        try container.encodeIfPresent(self.page, forKey: .page)
        try container.encodeIfPresent(self.limit, forKey: .limit)
    }
   
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decodeIfPresent([UserData].self, forKey: .data)
        self.total = try container.decodeIfPresent(Int.self, forKey: .total)
        self.page = try container.decodeIfPresent(Int.self, forKey: .page)
        self.limit = try container.decodeIfPresent(Int.self, forKey: .limit)
    }
}
struct UserData : Codable{
    let id, title, firstName, lastName: String?
    let picture: String?
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case firstName
        case lastName
        case picture
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.lastName, forKey: .lastName)
        try container.encodeIfPresent(self.picture, forKey: .picture)
    }
   
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        self.picture = try container.decodeIfPresent(String.self, forKey: .picture)
    }
}
