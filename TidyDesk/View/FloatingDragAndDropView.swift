//
//  FloatingDragAndDropView.swift
//  TidyDesk
//
//  Created by Steven Sarmiento on 2/12/24.
//

import SwiftUI

struct FloatingDragAndDropView: View {
    var body: some View {
        VStack{
        DragAndDropView()
            
        MinimalMenuBarView()
            .slideDown()
        }
    }
}
