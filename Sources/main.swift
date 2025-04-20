import Cocoa

// Create the application instance
let app = NSApplication.shared

// Set app as accessory (menu bar only)
NSApp.setActivationPolicy(.accessory)

// Create our app delegate instance
let delegate = AppDelegate()
app.delegate = delegate

// Create a status item
let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
if let button = statusItem.button {
    // Use a very visible emoji
    button.title = "📝"
    print("[SwiftNoteAI] Status bar item created with emoji")
}

// Setup menu
let menu = NSMenu()
menu.addItem(NSMenuItem(title: "Add Note…", action: #selector(AppDelegate.addNote(_:)), keyEquivalent: "n"))
menu.addItem(NSMenuItem(title: "Show Notes…", action: #selector(AppDelegate.showNotes(_:)), keyEquivalent: "l"))
menu.addItem(NSMenuItem(title: "Settings…", action: #selector(AppDelegate.openSettings(_:)), keyEquivalent: ","))
menu.addItem(NSMenuItem.separator())
menu.addItem(NSMenuItem(title: "Check for Updates…", action: #selector(AppDelegate.checkForUpdates(_:)), keyEquivalent: "u"))
menu.addItem(NSMenuItem.separator())
menu.addItem(NSMenuItem(title: "Quit SwiftNoteAI", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
statusItem.menu = menu

// Run the app
app.run()

// Define AppDelegate
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("[SwiftNoteAI] Application did finish launching")
        
        // Debug alert (remove for production)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let alert = NSAlert()
            alert.messageText = "SwiftNoteAI Running"
            alert.informativeText = "Look for the 📝 icon in your menu bar."
            alert.addButton(withTitle: "OK")
            alert.runModal()
        }
    }
    
    @objc func addNote(_ sender: Any?) {
        let alert = NSAlert()
        alert.messageText = "Add Note"
        alert.informativeText = "This feature will be implemented soon."
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
    
    @objc func showNotes(_ sender: Any?) {
        let alert = NSAlert()
        alert.messageText = "Show Notes"
        alert.informativeText = "This feature will be implemented soon."
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
    
    @objc func openSettings(_ sender: Any?) {
        let alert = NSAlert()
        alert.messageText = "Settings"
        alert.informativeText = "This feature will be implemented soon."
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
    
    @objc func checkForUpdates(_ sender: Any?) {
        let alert = NSAlert()
        alert.messageText = "Check for Updates"
        alert.informativeText = "This feature will be implemented soon."
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
} 