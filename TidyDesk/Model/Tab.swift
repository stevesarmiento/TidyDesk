//
//  Tab.swift
//  TidyDesk
//
//  Created by Steven Sarmiento on 2/12/24.
//

import SwiftUI

///Tabs

enum Tab: String, CaseIterable {
    case clean = "Organize"
    // case inbox = "Inbox"
    // case draft = "Draft"
    // case sent = "Sent"
    // case junk = "Junk"
    // case bin = "Bin"
    // case archive = "Archive"
    
    var sfSymbol: String {
        switch self {
        case .clean:
            return "folder.fill.badge.plus"
        // case .inbox:
        //     return "tray"
        // case .draft:
        //     return "folder"
        // case .sent:
        //     return "paperplane"
        // case .junk:
        //     return "xmark.bin"
        // case .bin:
        //     return "trash"
        // case .archive:
        //     return "archivebox"

        }
    }
}
