//
//  MinimalMenuBarView.swift
//  TidyDesk
//
//  Created by Steven Sarmiento on 2/12/24.
//

import SwiftUI

struct MinimalMenuBarView: View {
    var body: some View {
        HStack {
            VStack{
                Button(action: {
                    // Action for Home
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.05))
                            .frame(width: 60, height: 60)
                            .overlay(
                                Image(systemName: "book.pages")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 24))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(LinearGradient(gradient: Gradient(colors: [.white.opacity(0.1), .white.opacity(0.2)]), startPoint: .leading, endPoint: .trailing), lineWidth: 1)
                            )
//                        Text("Reader Mode")
//                            .font(.system(size: 11))
//                            .bold()
//                            .foregroundColor(.white.opacity(0.3))
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .pressAnimation()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 75)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white.opacity(0.1), Color.white.opacity(0.1)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [.white.opacity(0.1), .white.opacity(0.2)]), startPoint: .leading, endPoint: .trailing), lineWidth: 1)
                )
                .shadow(radius: 10)
            
        )

    }
}
