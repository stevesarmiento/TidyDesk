//
//  TidyDeskApp.swift
//  TidyDesk
//
//  Created by Steven Sarmiento on 2/11/24.
//

import SwiftUI

@main
struct TidyDeskApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
             Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        let contentView = FloatingDragAndDropView()

        window = CustomWindow(contentRect: NSRect(x: 0, y: 0, width: 600, height: 600), styleMask: [.borderless], backing: .buffered, defer: false)
        window.center()
        window.setIsVisible(true)
        window.contentView = NSHostingView(rootView: contentView)
    }
}

struct EmptyScene: Scene {
    var body: some Scene {
        WindowGroup {
            EmptyView()
        }
    }
}

// import SwiftUI

// @main
// struct TidyDeskApp: App {
//     var body: some Scene {
//         WindowGroup {
//             FloatingDragAndDropView()
//             MinimalMenuBarView()
//         }
//         .windowStyle(.hiddenTitleBar)
//     }
// }
//struct TidyDeskApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//        .windowStyle(.hiddenTitleBar)
//    }
//}
