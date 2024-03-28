//
//  RandomUser.swift
//  27_API_Call
//
//  Created by Digitalflake Mahesh K on 27/03/24.
//

import Foundation

//struct RandomUser<A, B: Error>: Codable {
//    var results: [Result<A, B>]
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encodeIfPresent(self.results, forKey: .results)
//
//    }
//    enum CodingKeys: CodingKey {
//        case results
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.results = try container.decodeIfPresent([String].self, forKey: .results)
//    }
//}

struct RandomUser : Codable{
    let results : [Result]
    let info : Info
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.results, forKey: .results)
        try container.encodeIfPresent(self.info, forKey: .info)
    }
    enum CodingKeys: CodingKey {
        case results
        case info
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decodeIfPresent([Result].self, forKey: .results)!
        self.info = try container.decodeIfPresent(Info.self, forKey: .info)!
    }
}
struct Result : Codable{
    let gender : String
    let name : Name?
    let location : Location?
    let email : String
    let login : Login?
    let dob : DOB?
    let registered : Registered?
    let phone : String?
    let cell : String?
    let id : ID?
    let pictures : Picture?
    let nat : String?
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.login, forKey: .login)
        try container.encodeIfPresent(self.dob, forKey: .dob)
        try container.encodeIfPresent(self.registered, forKey: .registered)
        try container.encodeIfPresent(self.phone, forKey: .phone)
        try container.encodeIfPresent(self.cell, forKey: .cell)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.pictures, forKey: .pictures)
        try container.encodeIfPresent(self.nat, forKey: .nat)
    }
    
    enum CodingKeys: CodingKey {
        case gender
        case name
        case location
        case email
        case login
        case dob
        case registered
        case phone
        case cell
        case id
        case pictures
        case nat
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)!
        self.name = try container.decodeIfPresent(Name.self, forKey: .name)
        self.location = try container.decodeIfPresent(Location.self, forKey: .location)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)!
        self.login = try container.decodeIfPresent(Login.self, forKey: .login)
        self.dob = try container.decodeIfPresent(DOB.self, forKey: .dob)
        self.registered = try container.decodeIfPresent(Registered.self, forKey: .registered)
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
        self.cell = try container.decodeIfPresent(String.self, forKey: .cell)
        self.id = try container.decodeIfPresent(ID.self, forKey: .id)
        self.pictures = try container.decodeIfPresent(Picture.self, forKey: .pictures)
        self.nat = try container.decodeIfPresent(String.self, forKey: .nat)
    }
}
struct Info : Codable{
    let seed : String
    let results : Int
    let page : Int
    let version : Version
    
}
struct Name : Codable{
    let title : String
    let first : String
    let last : String
}
struct Location : Codable{
    let street : Street
    let city : String
    let state : String
    let country : String
    let coordinates : Coordinates
    let timezone : Timezone
}
struct Login : Codable{
    
}
struct DOB : Codable{
    
}
struct Registered : Codable{
    
}
struct Picture : Codable{
    
}
struct Street : Codable{
    
}
struct Coordinates : Codable{
    
}
struct Timezone : Codable{
    
}
struct ID : Codable{
    
}
struct Version : Codable{
    
}
