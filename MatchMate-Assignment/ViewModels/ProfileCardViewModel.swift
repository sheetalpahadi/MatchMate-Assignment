//
//  ProfileCardViewModel.swift
//  MatchMate-Assignment
//
//  Created by Admin on 14/07/25.
//

import Foundation

class ProfileCardViewModel: ObservableObject {
    
    @Published var person: PersonModel
    @Published var fullName: String = ""
    @Published var location: String = ""
    @Published var profileImageUrl: String = ""
    @Published var profileMatchStatus: ProfileMatchStatus = .none
    
    enum ProfileMatchStatus: String {
        case none
        case accepted
        case declined
    }
    
    init(person: PersonModel) {
        self.person = person
        setName()
        setAddress()
        self.profileImageUrl = person.picture?.thumbnail ?? ""
    }
    
    func setName() {
        if let firstName = person.name?.first {
            fullName = firstName
        }
        
        if let lastName = person.name?.last {
            fullName = fullName + " " + lastName
        }
    }
    
    func setAddress() {
        let streetNumber = person.location?.street?.number
        let streetName = person.location?.street?.name
        let city = person.location?.city
        let state = person.location?.state
        
        if let streetNumber = streetNumber {
            location = String(streetNumber) + ", "
        }
        if let streetName = streetName {
            location = location + streetName + "\n"
        }
        if let city = city {
            location = location + city + ", "
        }
        if let state = state {
            location = location + state
        }
        
    }
}

