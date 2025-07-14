//
//  ProfileCardView.swift
//  MatchMate-Assignment
//
//  Created by Admin on 14/07/25.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct ProfileCardView: View {
    
    @StateObject var viewModel: ProfileCardViewModel
    
    var body: some View {
        if viewModel.profileMatchStatus == .none {
            cardViewWithNoStatus
        } else {
            cardViewWithStatus
        }
    }
    
    var cardViewWithNoStatus: some View {
        VStack(spacing: 16) {
            WebImage(url: URL(string: viewModel.profileImageUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(12)
            VStack(spacing: 8) {
                Text(viewModel.fullName)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.teal)
                Text(viewModel.location)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            HStack(spacing: 24) {
                CircularButton(systemImageName: "xmark", buttonType: .destructive) {
                    viewModel.profileMatchStatus = .declined
                    print("declined")
                }
                CircularButton(systemImageName: "checkmark", buttonType: .primary) {
                    viewModel.profileMatchStatus = .accepted
                    print("accepted")
                }
            }
        }
        .frame(height: 400)
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.white))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 4, y: 4)
        )
        .padding(.horizontal, 16)
    }
    
    var cardViewWithStatus: some View {
        VStack(spacing: 16) {
            WebImage(url: URL(string: viewModel.profileImageUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(12)
            VStack(spacing: 8) {
                Text(viewModel.fullName)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.teal)
                Text(viewModel.location)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            
            if viewModel.profileMatchStatus == .accepted {
                StatusButton(buttonTitle: "Accepted", buttonType: .primary)
            } else if viewModel.profileMatchStatus == .declined {
                StatusButton(buttonTitle: "Declined", buttonType: .destructive)
            }
        }
        .frame(height: 400)
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.white))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 4, y: 4)
        )
        .padding(.horizontal, 16)

    }
}
//
//#Preview {
//    ProfileCardView()
//}
