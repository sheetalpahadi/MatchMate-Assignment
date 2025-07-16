//
//  ProfilesMatchResultsStore.swift
//  MatchMate-Assignment
//
//  Created by Admin on 16/07/25.
//

import Foundation
import CoreData
import SwiftUI

struct ProfilesMatchStatusStore {
    
    static func save(profileId: String, matchStatus: String, firstName: String, in managedContext: NSManagedObjectContext) {
        let newProfile = ProfileMatchStatus(context: managedContext)
        newProfile.profileId = profileId
        newProfile.matchStatus = matchStatus
        newProfile.firstName = firstName

        do {
            try managedContext.save()
        } catch {
            print("Save error:", error.localizedDescription)
        }
    }

    static func delete(profileId: String, from results: FetchedResults<ProfileMatchStatus>, in managedContext: NSManagedObjectContext) {
        for profile in results {
            if profile.profileId == profileId {
                managedContext.delete(profile)
            }
        }

        do {
            try managedContext.save()
        } catch {
            print("Delete error:", error.localizedDescription)
        }
    }

    static func clearAll(from results: FetchedResults<ProfileMatchStatus>, in context: NSManagedObjectContext) {
        for profile in results {
            context.delete(profile)
        }

        do {
            try context.save()
        } catch {
            print("Clear error:", error.localizedDescription)
        }
    }
}
