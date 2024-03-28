//
//  NagerDate.swift
//  27_API_Call
//
//  Created by Digitalflake Mahesh K on 28/03/24.
//

import Foundation

struct NagerDate : Codable{
    let date : String?
    let localName : String?
    let name : String?
    let type : String?
    let countryCode : String?
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.localName, forKey: .localName)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.countryCode, forKey: .countryCode)
    }
    enum CodingKeys: CodingKey {
        case date
        case localName
        case name
        case type
        case countryCode
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decodeIfPresent(String.self, forKey: .date)
        self.localName = try container.decodeIfPresent(String.self, forKey: .localName)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.countryCode = try container.decodeIfPresent(String.self, forKey: .countryCode)
    }
}
