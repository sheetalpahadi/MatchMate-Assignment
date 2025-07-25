//
//  HomeViewModel.swift
//  MatchMate-Assignment
//
//  Created by Admin on 14/07/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var profiles: [PersonModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    
    init(profiles: [PersonModel] = []) {
        self.profiles = profiles
    }
    
    func fetchProfiles(completion: @escaping (Bool) -> Void) {
        isLoading = true
        errorMessage = nil
        
        NetworkManager.shared.fetchProfiles() { result, isFromCache in
            self.isLoading = false
            switch result {
            case .success(let profilesResponse):
                if isFromCache {
                    self.errorMessage = "Failed to fetch results due to some issues"
                } else {
                    self.errorMessage = nil
                }
                self.profiles = profilesResponse.results
                completion(true)
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                print("Failed to load user profile:", error)
                completion(false)
            }
        }
    }
}
