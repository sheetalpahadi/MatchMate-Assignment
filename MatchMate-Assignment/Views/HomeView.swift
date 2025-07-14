//
//  HomeView.swift
//  MatchMate-Assignment
//
//  Created by Admin on 14/07/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Profile Matches")
                .font(.system(size: 24, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView() {
                ForEach (0 ..< 10, id: \.self) { index in
                    ProfileCardView()
                    if index != 9 {
                        Spacer()
                            .frame(height: 18)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding()
        .padding(.horizontal, 16)
        .padding(.bottom, 0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    HomeView()
}
