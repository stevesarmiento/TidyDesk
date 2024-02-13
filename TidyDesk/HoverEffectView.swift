import SwiftUI
import AppKit

struct HoverEffectView: NSViewRepresentable {
    @Binding var hoverPosition: CGPoint

    func makeNSView(context: Context) -> NSView {
        let view = HoverTrackingView()
        let trackingArea = NSTrackingArea(rect: view.bounds, options: [.activeAlways, .mouseMoved, .mouseEnteredAndExited], owner: view, userInfo: nil)
        
        view.updateTrackingAreas() 
        view.addTrackingArea(trackingArea)
        view.mouseMovedAction = { event in
            //print("Mouse moved")
            context.coordinator.mouseMoved(with: event)
        }
        view.mouseExitedAction = { event in
            //print("Mouse exited")
            context.coordinator.mouseExited(with: event)
        }
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: HoverEffectView

        init(_ parent: HoverEffectView) {
            self.parent = parent
        }

        func mouseMoved(with event: NSEvent) {
            let location = event.locationInWindow
            let x = (location.x - parent.hoverPosition.x - 10) * 0.03
            let y = (location.y - parent.hoverPosition.y - 10) * 0.03
            DispatchQueue.main.async {
                self.parent.hoverPosition = CGPoint(x: x, y: y)
            }
        }

        func mouseExited(with event: NSEvent) {
            DispatchQueue.main.async {
                self.parent.hoverPosition = CGPoint(x: 0, y: 0)
            }
        }
    }
}

class HoverTrackingView: NSView {
    var mouseMovedAction: ((NSEvent) -> Void)?
    var mouseExitedAction: ((NSEvent) -> Void)?

    override func updateTrackingAreas() {
        super.updateTrackingAreas()
        self.trackingAreas.forEach { self.removeTrackingArea($0) }

        let options: NSTrackingArea.Options = [.activeAlways, .mouseMoved, .mouseEnteredAndExited]
        let trackingArea = NSTrackingArea(rect: self.bounds, options: options, owner: self, userInfo: nil)
        self.addTrackingArea(trackingArea)
    }

    override func mouseMoved(with event: NSEvent) {
        mouseMovedAction?(event)
    }

    override func mouseExited(with event: NSEvent) {
        mouseExitedAction?(event)
    }
}
