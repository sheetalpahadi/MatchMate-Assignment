//
//  NetworkManager.swift
//  MatchMate-Assignment
//
//  Created by Admin on 14/07/25.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    let baseURL = "https://randomuser.me/api/?results=10"
    let headers: HTTPHeaders = []
        
    func fetchProfiles(completion: @escaping (Result<FetchProfilesResponse, AFError>) -> Void) {
        AF.request(baseURL, headers: headers)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: FetchProfilesResponse.self) { response in
                completion(response.result)
            }
    }
}




