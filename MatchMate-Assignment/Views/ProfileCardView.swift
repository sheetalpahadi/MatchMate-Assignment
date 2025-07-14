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
    var body: some View {
        VStack(spacing: 16) {
            WebImage(url: URL(string: "https://baconmockup.com/250/250/"))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(12)
            VStack(spacing: 8) {
                Text("John Cena")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.teal)
                Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis nat")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            HStack(spacing: 24) {
                Image(systemName: "xmark")
                    .frame(width: 30, height: 30)
                    .padding(10)
                    .background(
                    Circle()
                        .fill(Color.clear)
                        .stroke(.teal, lineWidth: 1.0)
                    )
                Image(systemName: "checkmark")
                    .frame(width: 30, height: 30)
                    .padding(10)
                    .background(
                    Circle()
                        .fill(Color.clear)
                        .stroke(.teal, lineWidth: 1.0)
                    )
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

#Preview {
    ProfileCardView()
}
