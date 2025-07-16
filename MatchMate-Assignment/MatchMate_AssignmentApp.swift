//
//  MatchMate_AssignmentApp.swift
//  MatchMate-Assignment
//
//  Created by Admin on 14/07/25.
//

import SwiftUI
import CoreData

@main
struct MatchMate_AssignmentApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

class PersistenceController: ObservableObject {
  let container = NSPersistentContainer(name: "ProfilesMatchStatus")

  static let shared = PersistenceController()

  private init() {
    container.loadPersistentStores { description, error in
      if let error = error {
        print("Core Data failed to load: \(error.localizedDescription)")
      }
    }
  }
}
