//
//  HomeView.swift
//  MatchMate-Assignment
//
//  Created by Admin on 14/07/25.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    @Environment(\.managedObjectContext) var managedContext
    @FetchRequest(entity: ProfileMatchStatus.entity(), sortDescriptors: [])

    var profilesMatchStatus: FetchedResults<ProfileMatchStatus>
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Profile Matches")
                .font(.system(size: 24, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                .frame(height: 16)
            ScrollView() {
                ForEach (viewModel.profiles.indices, id: \.self) { index in
                    let profileCardViewModel = ProfileCardViewModel(person: viewModel.profiles[index])
                    ProfileCardView(viewModel: profileCardViewModel, didAccept: {
                        if let profileId = profileCardViewModel.person.id?.value {
                            deleteProfileMatchStatus(for: profileId)
                            saveProfileMatchStatus(profileId: profileId, matchStatus: "accepted", firstName: profileCardViewModel.person.name?.first ?? "")
                            
                        }
                    }, didDecline: {
                        if let profileId = profileCardViewModel.person.id?.value {
                            deleteProfileMatchStatus(for: profileId)
                            saveProfileMatchStatus(profileId: profileId, matchStatus: "declined", firstName: profileCardViewModel.person.name?.first ?? "")
                            
                        }
                    })
                        .onAppear {
                            if let profileId = profileCardViewModel.person.id?.value {
                                saveProfileMatchStatus(profileId: profileId, matchStatus: profileCardViewModel.profileMatchStatus.rawValue, firstName: profileCardViewModel.person.name?.first ?? "")
                            }
                        }
                    Spacer()
                        .frame(height: 18)
                }
            }
            .scrollIndicators(.hidden)
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.system(size: 12, weight: .medium))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12.0)
                            .fill(.white)
                            .stroke(.teal, lineWidth: 1.0)
                    )
                    .padding(.bottom, 24)
            }
        }
        .padding()
        .padding(.horizontal, 16)
        .padding(.bottom, 0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            viewModel.fetchProfiles() { isSuccess in
                if isSuccess {
                    clearAllProfileMatchStatus()
                }
            }
        }
    }
    
    func saveProfileMatchStatus(profileId: String, matchStatus: String, firstName: String) {
       let newProfile = ProfileMatchStatus(context: self.managedContext)
        newProfile.profileId = profileId
        newProfile.matchStatus = matchStatus
        newProfile.firstName = firstName

       do {
         try self.managedContext.save()
       } catch {
         print(error.localizedDescription)
       }
     }

     func deleteProfileMatchStatus(for profileId: String) {
       for profile in profilesMatchStatus {
           if profile.profileId == profileId {
               managedContext.delete(profile)
           }
       }
       do {
         try managedContext.save()
       } catch {
         print(error.localizedDescription)
       }
     }
    
    func clearAllProfileMatchStatus() {
        for profile in profilesMatchStatus {
            managedContext.delete(profile)
        }
      do {
        try managedContext.save()
      } catch {
        print(error.localizedDescription)
      }
    }

}

#Preview {
    HomeView()
}
