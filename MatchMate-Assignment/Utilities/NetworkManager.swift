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

    private let cacheFileName = "fetchProfilesResponse.json"

    func fetchProfiles(completion: @escaping (Result<FetchProfilesResponse, Error>, Bool) -> Void) {
        AF.request(baseURL, headers: headers)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: FetchProfilesResponse.self) { response in
                switch response.result {
                case .success(let data):
                    self.saveToDisk(data)
                    completion(.success(data), false)
                case .failure(let error):
                    if let cachedResponse = self.loadFromDisk() {
                        completion(.success(cachedResponse), true)
                    } else {
                        completion(.failure(error), false)
                    }
                }
            }
    }

    private func cacheFileURL() -> URL {
        let folder = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        return folder.appendingPathComponent(cacheFileName)
    }

    private func saveToDisk(_ response: FetchProfilesResponse) {
        let url = cacheFileURL()
        do {
            let data = try JSONEncoder().encode(response)
            try data.write(to: url)
        } catch {
            //
        }
    }

    private func loadFromDisk() -> FetchProfilesResponse? {
        let url = cacheFileURL()
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(FetchProfilesResponse.self, from: data)
            return decoded
        } catch {
            return nil
        }
    }
}
