//
//  CircularButton.swift
//  MatchMate-Assignment
//
//  Created by Admin on 15/07/25.
//

import SwiftUI

struct CircularButton: View {
    
    var systemImageName: String
    var buttonType: ButtonType = .primary
    var onTapClosure: (() -> Void)? = nil
    @State var isInteracting: Bool = false
    
    enum ButtonType: String {
        case primary
        case destructive
    }
    
    var body: some View {
        Image(systemName: systemImageName)
            .foregroundColor(isInteracting ? Color.white : Color.black)
            .frame(width: 30, height: 30)
            .padding(10)
            .background(
            Circle()
                .fill(isInteracting ? (buttonType == .primary ? Color.teal : Color.red): Color.clear)
                .stroke(isInteracting ? (buttonType == .primary ? Color.teal : Color.red): Color.teal, lineWidth: 1.0)
            )
            .animation(.easeInOut(duration: 0.1), value: isInteracting)
            .onTapGesture {
                isInteracting = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.isInteracting = false
                    onTapClosure?()
                }
            }
    }
}

//#Preview {
//    CircularButton()
//}
