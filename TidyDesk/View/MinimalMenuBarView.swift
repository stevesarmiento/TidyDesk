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
                    VStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.clear)
                            .frame(width: 60, height: 60)
                            .overlay(
                                Image(systemName: "book.pages")
                                    .foregroundColor(.white.opacity(0.3))
                                    .font(.system(size: 24))
                            )
                        Text("Reader Mode")
                            .font(.system(size: 11))
                            .bold()
                            .foregroundColor(.white.opacity(0.3))
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .pressAnimation()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 75)
        .background(
            BlurView(material: .sidebar, blendingMode: .withinWindow)
                
            )
        .clipShape(RoundedRectangle(cornerRadius: 17))
        .overlay(
            RoundedRectangle(cornerRadius: 17)
                .stroke(Color.white.opacity(0.15), lineWidth: 1)
            )

    }
}
