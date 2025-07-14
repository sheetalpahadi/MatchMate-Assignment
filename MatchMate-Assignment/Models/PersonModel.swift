//
//  PersonModel.swift
//  MatchMate-Assignment
//
//  Created by Admin on 14/07/25.
//

import Foundation

struct PersonModel: Codable, Hashable {
    let id: UUID
    let name: Name?
    let location: Location?
    let picture: ProfileImage?

    init(name: Name? = nil, location: Location? = nil, picture: ProfileImage? = nil) {
        self.id = UUID()
        self.name = name
        self.location = location
        self.picture = picture
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        name = try container.decodeIfPresent(Name.self, forKey: .name)
        location = try container.decodeIfPresent(Location.self, forKey: .location)
        picture = try container.decodeIfPresent(ProfileImage.self, forKey: .picture)
    }
    
    static func == (lhs: PersonModel, rhs: PersonModel) -> Bool {
        if lhs.id == rhs.id {
            return true
        }
        return false
    }

    enum CodingKeys: String, CodingKey {
        case name
        case location
        case picture
    }
}

struct Name: Codable , Hashable{
    let first: String?
    let last: String?

    init(first: String? = nil, last: String? = nil) {
        self.first = first
        self.last = last
    }

    enum CodingKeys: String, CodingKey {
        case first
        case last
    }
}

struct Location: Codable, Hashable {
    let street: Street?
    let city: String?
    let state: String?

    init(street: Street? = nil, city: String? = nil, state: String? = nil) {
        self.street = street
        self.city = city
        self.state = state
    }

    enum CodingKeys: String, CodingKey {
        case street
        case city
        case state
    }
}

struct Street: Codable, Hashable {
    let number: Int?
    let name: String?

    init(number: Int? = nil, name: String? = nil) {
        self.number = number
        self.name = name
    }

    enum CodingKeys: String, CodingKey {
        case number
        case name
    }
}

struct ProfileImage: Codable, Hashable {
    let thumbnail: String?

    init(thumbnail: String? = nil) {
        self.thumbnail = thumbnail
    }

    enum CodingKeys: String, CodingKey {
        case thumbnail
    }
}
