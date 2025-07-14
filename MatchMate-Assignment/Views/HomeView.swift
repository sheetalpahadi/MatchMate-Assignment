//
//  HomeView.swift
//  MatchMate-Assignment
//
//  Created by Admin on 14/07/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            Text("Profile Matches")
                .font(.system(size: 24, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView() {
                
                ForEach (viewModel.profiles.indices, id: \.self) { index in
                    let profilecCardViewModel = ProfileCardViewModel(person: viewModel.profiles[index])
                    ProfileCardView(viewModel: profilecCardViewModel)
                    Spacer()
                        .frame(height: 18)
                    
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding()
        .padding(.horizontal, 16)
        .padding(.bottom, 0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            viewModel.fetchProfiles()
        }
    }
}

#Preview {
    HomeView()
}
