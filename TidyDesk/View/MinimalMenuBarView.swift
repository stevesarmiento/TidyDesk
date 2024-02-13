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
        @State private var isXmarkHovered: Bool = false
        @State private var xmarkHoverPosition = CGPoint.zero
        @State private var settingsHoverPosition = CGPoint.zero        
//@State private var opacity: CGFloat = 0

    var body: some View {
        HStack {
                Button(action: {
                    NSApplication.shared.terminate(nil)
                }) {
                    VStack {
                        Image(systemName: "xmark.circle.fill")
                            .frame(width: 56, height: 56)
                            .foregroundColor(.white.opacity(1))
                            .font(.system(size: 24))
                    }
                    .frame(width: 56, height: 56)

                }
                .frame(width: 56, height: 56)
                .background(
                    ZStack {
                        HoverEffectView(hoverPosition: $xmarkHoverPosition)
                        RoundedRectangle(cornerRadius: 14)
                            .fill(isXmarkHovered ? Color.white.opacity(0.1) : Color.clear) 
                            .offset(x: xmarkHoverPosition.x, y: xmarkHoverPosition.y)
                            .offset(x: -7)

                    }
                )
                .buttonStyle(PlainButtonStyle())
                .onHover(perform: { hovering in
                    isXmarkHovered = hovering
                })
                .pressAnimation()

            Divider()
                .background(Color.white.opacity(0.02))

                Button(action: {
                    showSettings.toggle()
                }) {
                    VStack {
                        Image(systemName: "gearshape.fill")
                            .frame(width: 56, height: 56)
                            .foregroundColor(.white.opacity(1))
                            .font(.system(size: 24))  
                    }
                    .frame(width: 56, height: 56)

                }
                .frame(width: 56, height: 56)
                .background(
                    ZStack {
                        HoverEffectView(hoverPosition: $settingsHoverPosition)
                        RoundedRectangle(cornerRadius: 14)
                            .fill(isSettingsHovered ? Color.white.opacity(0.1) : Color.clear) 
                            .offset(x: settingsHoverPosition.x, y: settingsHoverPosition.y)
                            .offset(x: -10)
                    }
                )
                .buttonStyle(PlainButtonStyle())
                .onHover(perform: { hovering in
                    isSettingsHovered = hovering
                })
                .pressAnimation()
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
