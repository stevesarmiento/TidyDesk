//
//  CustomWindow.swift
//  TidyDesk
//
//  Created by Steven Sarmiento on 2/12/24.
//

import Cocoa

class CustomWindow: NSWindow {
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: [.borderless], backing: backingStoreType, defer: flag)
        self.isMovableByWindowBackground = true
        self.level = .floating
        self.backgroundColor = NSColor.clear
        self.isOpaque = false
    }
}
