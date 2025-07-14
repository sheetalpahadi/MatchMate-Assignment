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
        VStack(spacing: 0) {
            Text("Profile Matches")
                .font(.system(size: 24, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                .frame(height: 16)
            ScrollView() {
                ForEach (viewModel.profiles.indices, id: \.self) { index in
                    let profilecCardViewModel = ProfileCardViewModel(person: viewModel.profiles[index])
                    ProfileCardView(viewModel: profilecCardViewModel)
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
            viewModel.fetchProfiles()
        }
    }
}

#Preview {
    HomeView()
}
