//
//  StatusButton.swift
//  MatchMate-Assignment
//
//  Created by Admin on 15/07/25.
//

import SwiftUI

struct StatusButton: View {
    
    var buttonTitle: String
    var buttonType: ButtonType = .primary
    
    enum ButtonType: String {
        case primary
        case destructive
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12.0)
            .fill(buttonType == .primary ? Color.teal : Color.red)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .overlay(
                Text(buttonTitle)
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .medium))
            )
    }
}
