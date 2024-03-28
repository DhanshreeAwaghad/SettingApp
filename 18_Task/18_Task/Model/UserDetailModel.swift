//
//  UserDetailModel.swift
//  18_Task
//
//  Created by Digitalflake Mahesh K on 28/03/24.
//

import Foundation

struct UserDetailModel : Codable{
    let id, title, firstName, lastName: String?
    let picture: String?
    let gender, email, dateOfBirth, phone: String?
    let registerDate, updatedDate: String?
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.firstName, forKey: .firstName)
        try container.encodeIfPresent(self.lastName, forKey: .lastName)
        try container.encodeIfPresent(self.picture, forKey: .picture)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.dateOfBirth, forKey: .dateOfBirth)
        try container.encodeIfPresent(self.phone, forKey: .phone)
        try container.encodeIfPresent(self.registerDate, forKey: .registerDate)
        try container.encodeIfPresent(self.updatedDate, forKey: .updatedDate)
    }
    enum CodingKeys: CodingKey {
        case id
        case title
        case firstName
        case lastName
        case picture
        case gender
        case email
        case dateOfBirth
        case phone
        case registerDate
        case updatedDate
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        self.picture = try container.decodeIfPresent(String.self, forKey: .picture)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.dateOfBirth = try container.decodeIfPresent(String.self, forKey: .dateOfBirth)
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
        self.registerDate = try container.decodeIfPresent(String.self, forKey: .registerDate)
        self.updatedDate = try container.decodeIfPresent(String.self, forKey: .updatedDate)
    }
}

