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
                        setStatusAccepted(for: profileCardViewModel)
                    }, didDecline: {
                        setStatusDeclined(for: profileCardViewModel)
                    })
                    .onAppear {
                        setStatusNone(for: profileCardViewModel)
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
//                    ProfilesMatchStatusStore.clearAll(from: profilesMatchStatus, in: managedContext)
                }
            }
        }
    }
    
    func setStatusAccepted(for profileCardViewModel: ProfileCardViewModel) {
        if let profileId = profileCardViewModel.person.id?.value {
            ProfilesMatchStatusStore.delete(profileId: profileId, from: profilesMatchStatus, in: managedContext)
            ProfilesMatchStatusStore.save(profileId: profileId, matchStatus: "accepted", firstName: profileCardViewModel.person.name?.first ?? "", in: managedContext)
        }
    }
    
    
    func setStatusDeclined(for profileCardViewModel: ProfileCardViewModel) {
        if let profileId = profileCardViewModel.person.id?.value {
            ProfilesMatchStatusStore.delete(profileId: profileId, from: profilesMatchStatus, in: managedContext)
            ProfilesMatchStatusStore.save(profileId: profileId, matchStatus: "declined", firstName: profileCardViewModel.person.name?.first ?? "", in: managedContext)
        }
    }
    
    
    func setStatusNone(for profileCardViewModel: ProfileCardViewModel) {
        if let profileId = profileCardViewModel.person.id?.value {
            ProfilesMatchStatusStore.delete(profileId: profileId, from: profilesMatchStatus, in: managedContext)
            ProfilesMatchStatusStore.save(profileId: profileId, matchStatus: profileCardViewModel.profileMatchStatus.rawValue, firstName: profileCardViewModel.person.name?.first ?? "", in: managedContext)
        }
    }
  
}

#Preview {
    HomeView()
}
