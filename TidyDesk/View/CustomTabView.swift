//
//  CustomTabView.swift
//  TidyDesk
//
//  Created by Steven Sarmiento on 2/12/24.
//

import SwiftUI


struct CustomTabView<Content: View, T: Hashable>: View {
    var hideTabBar: Bool = true
    @Binding var selection: T
    @ViewBuilder var content: Content
    
    var body: some View {
        ScrollView(.init()){
            TabView(selection: $selection) {
                content
            }
            .background(TabFinder(hide: hideTabBar))
        }
    }
}


fileprivate struct TabFinder: NSViewRepresentable {
    var hide: Bool
    func makeNSView(context: Context) -> NSView {
        return .init()
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            if let superView = nsView.superview?.superview {
                if let tabView = superView.subviews(type: NSTabView.self).first {
                    tabView.tabPosition = hide ? .none : .top
                    tabView.tabViewBorderType = hide ? .none : .bezel
                }
            }
        }
    }
}

fileprivate extension NSView {
    func subviews<Type: NSView>(type: Type.Type) -> [Type] {
        var views = subviews.compactMap({ $0 as? Type })
        ///iterating thru subviews
        for subView in subviews {
            views.append(contentsOf: subView.subviews(type: type))
        }
        
        return views
    }
}
