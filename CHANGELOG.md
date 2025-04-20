# Changelog

All notable changes to this project will be documented in this file.

## Unreleased

- Integrated `StatusBarController` in `AppDelegate` to display menu bar icon.
- Added `build/` and `*.app` entries to `.gitignore` to ignore build artifacts and app bundles.
- Removed outdated root-level app bundle from the project root.
- Updated `SettingsWindowManager` to hide the settings window on close instead of quitting the app.
- Removed unsupported `.allowsZeroModifiers` call in `SettingsView.swift`.

## [0.1.0] - 2025-05-01

### Added
- Initialized GitHub repo `mironpuzanov/SwiftNoteAI` with:
  - `README.md`
  - `.gitignore`
- CI workflow: `.github/workflows/ci.yml` (SwiftLint + Xcode build & tests)
- XcodeGen configuration: `project.yml`
- Generated Xcode project: `SwiftNoteAI.xcodeproj`
- App metadata: `Resources/Info.plist`
- Stub `StatusBarController.swift` in `Sources/` with placeholder SF Symbol icon 