import SwiftUI
import AppKit

final class FloatingInputWindowManager {
    static let shared = FloatingInputWindowManager()
    private var window: NSWindow?
    private var eventMonitor: Any?

    /// Show or bring the floating input window
    func show() {
        if let window = window {
            window.makeKeyAndOrderFront(nil)
        } else {
            let contentView = FloatingInputView()
            let panel = NSWindow(
                contentRect: NSRect(x: 0, y: 0, width: 400, height: 100),
                styleMask: [.titled, .fullSizeContentView],
                backing: .buffered,
                defer: false)
            panel.isOpaque = false
            panel.backgroundColor = .clear
            panel.level = .floating
            panel.hasShadow = true
            panel.contentView = NSHostingView(rootView: contentView)
            panel.center()
            window = panel
            panel.makeKeyAndOrderFront(nil)

            // Monitor for ESC key to hide
            eventMonitor = NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
                if event.keyCode == 53 { // ESC
                    self.hide()
                    return nil
                }
                return event
            }
        }
        NSApp.activate(ignoringOtherApps: true)
    }

    /// Hide the floating input window
    func hide() {
        window?.orderOut(nil)
        if let monitor = eventMonitor {
            NSEvent.removeMonitor(monitor)
            eventMonitor = nil
        }
    }
} 