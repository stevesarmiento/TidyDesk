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
        DragAndDropView() // Your existing DragAndDropView code here
            .frame(width: 300, height: 300)
        MinimalMenuBarView()
        }


           
    }
}
