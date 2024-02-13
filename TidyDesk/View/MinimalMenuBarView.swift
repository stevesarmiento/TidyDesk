//
//  MinimalMenuBarView.swift
//  TidyDesk
//
//  Created by Steven Sarmiento on 2/12/24.
//

import SwiftUI

struct MinimalMenuBarView: View {
        @Binding var showSettings: Bool
        @State private var isSettingsHovered: Bool = false
        @State private var isBookHovered: Bool = false
        @State private var isXmarkHovered: Bool = false

    var body: some View {
        HStack {
            VStack{
                Button(action: {
                    NSApplication.shared.terminate(nil)
                }) {
                    VStack {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white.opacity(1))
                            .font(.system(size: 24))
                    }
                    .frame(width: 56, height: 56)

                }
                .background(
                    RoundedRectangle(cornerRadius: 16)
                      .fill(isXmarkHovered ? Color.white.opacity(0.1) : Color.clear)
                )
                .buttonStyle(PlainButtonStyle())
                .buttonStyle(PlainButtonStyle())
                .onHover(perform: { hovering in
                    isXmarkHovered = hovering
                })
                .pressAnimation()
            }
            Divider()
                .background(Color.white.opacity(0.02))
            // VStack{
            //     Button(action: {
            //         // Action for Home
            //     }) {
            //         VStack {
            //             Image(systemName: "book.pages")
            //                .foregroundColor(.white.opacity(1))
            //                .font(.system(size: 24))
            //             Text("Reader Mode")
            //                 .font(.system(size: 11))
            //                 .bold()
            //                 .foregroundColor(.white.opacity(0.3))
            //         }
            //         .padding()
            //     }
            //     .background(
            //             RoundedRectangle(cornerRadius: 16)
            //                 .fill(isBookHovered ? Color.white.opacity(0.2) : Color.clear)
            //     )
            //     .buttonStyle(PlainButtonStyle())
            //     .onHover(perform: { hovering in
            //         isBookHovered = hovering
            //     })
            //     //.background(isSettingsHovered ? Color.white.opacity(0.2) : Color.clear)
            //     .pressAnimation()
            // }
            VStack{
                Button(action: {
                    showSettings.toggle()
                }) {
                    VStack {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.white.opacity(1))
                            .font(.system(size: 24))  
                        // Text("Settings")
                        //     .font(.system(size: 11))
                        //     .bold()
                        //     .foregroundColor(.white.opacity(0.3))
                    }
                    .frame(width: 56, height: 56)

                }
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(isSettingsHovered ? Color.white.opacity(0.1) : Color.clear)
                )
                .buttonStyle(PlainButtonStyle())
                .onHover(perform: { hovering in
                    isSettingsHovered = hovering
                })
                .pressAnimation()
            }
        }
        .frame(minWidth: 0, maxHeight: 56)
        .padding(6)
        .padding(.horizontal, 1)
        .background(
            BlurView(material: .sidebar, blendingMode: .withinWindow) 
            )
        .clipShape(RoundedRectangle(cornerRadius: 17))
        .overlay(
            RoundedRectangle(cornerRadius: 17)
                .stroke(Color.white.opacity(0.3), lineWidth: 1)
            )

    }
}
