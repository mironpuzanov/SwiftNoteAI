import AppKit
import SwiftUI
import KeyboardShortcuts

struct SettingsView: View {
    @AppStorage("nodesFolderPath") private var nodesFolder: String = ""
    @AppStorage("autoUpdateEnabled") private var autoUpdate: Bool = true
    @AppStorage("launchOnLoginEnabled") private var launchOnLogin: Bool = false
    @AppStorage("errorLoggingEnabled") private var errorLogging: Bool = false

    private var generalSection: some View {
        return VStack(alignment: .leading, spacing: 12) {
            sectionHeader("General & Integrations")
            HStack {
                Text("Nodes storage location")
                Spacer()
                Button(action: openFolderPicker) {
                    Text(nodesFolder.isEmpty ? "Select…" : nodesFolder)
                        .frame(minWidth: 80)
                }
            }
            // ... rest unchanged ...
        }
    }

    private var configurationSection: some View {
        return VStack(alignment: .leading, spacing: 12) {
            sectionHeader("Configuration")
            HStack {
                Text("Toggle Recording")
                Spacer()
                KeyboardShortcuts.Recorder(for: .toggleRecording)
            }
            HStack {
                Text("Cancel Recording")
                Spacer()
                KeyboardShortcuts.Recorder(for: .cancelRecording)
            }
            HStack {
                Text("Change Mode")
                Spacer()
                KeyboardShortcuts.Recorder(for: .changeMode)
            }
        }
    }

    // MARK: - Actions
    private func openFolderPicker() {
        let panel = NSOpenPanel()
        panel.canChooseDirectories = true
        panel.canChooseFiles = false
        panel.allowsMultipleSelection = false
        panel.begin { response in
            if response == .OK, let url = panel.url {
                nodesFolder = url.path
            }
        }
    }

    // ... existing helpers ...
} 