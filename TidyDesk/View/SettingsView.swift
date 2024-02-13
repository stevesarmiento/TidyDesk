//
//  SettingsView.swift
//  TidyDesk
//
//  Created by Steven Sarmiento on 2/12/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Settings")
                .font(.largeTitle)
                .padding()

            // Placeholder options
            Button("Option 1", action: {})
            Button("Option 2", action: {})
            Button("Option 3", action: {})
        }
        .padding()
        .background(Color(NSColor.windowBackgroundColor))
        .cornerRadius(16)
        .shadow(radius: 20)
        .slideDown()
    }
}

