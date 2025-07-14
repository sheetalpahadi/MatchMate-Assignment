//
//  FetchProfilesResponse.swift
//  MatchMate-Assignment
//
//  Created by Admin on 15/07/25.
//

import Foundation

struct FetchProfilesResponse: Codable {
    let results: [PersonModel]

    enum CodingKeys: String, CodingKey {
        case results
    }

    init(results: [PersonModel] = []) {
        self.results = results
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decodeIfPresent([PersonModel].self, forKey: .results) ?? []
    }
}
