//
//  FloatingDragAndDropView.swift
//  TidyDesk
//
//  Created by Steven Sarmiento on 2/12/24.
//

import SwiftUI

struct FloatingDragAndDropView: View {
    @State private var showSettings = false // Add this line

    var body: some View {
        VStack{
            DragAndDropView(showSettings: $showSettings)
                
            MinimalMenuBarView(showSettings: $showSettings)
                .slideDown()
        }
    }
}
