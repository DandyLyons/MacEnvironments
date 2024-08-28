# MacEnvironments
An example reference project to check which runtime checks will trigger for your Mac app. This project has an extremely small app defined
in `MacEnvironmentsApp.swift` and three targets `Mac`, `MacCatalyst` and `MacDesignedForiPad`. Simply build and run to see which runtime 
checks trigger. 

## Reason
Developing for macOS can be quite complicated, in particular because there are at least 3 different Apple supported ways to write a Mac app: 

1. **Mac**: A native Mac app
2. **Mac (Catalyst)**: An iPad app converted to Mac using Mac Catalyst
3. **Mac(Designed for iPad)**: An iPad app running natively on an Apple Silicon Mac

In this project, checks include: 
1. `#if os()`
2. `#if targetEnvironment()`
3. `#if canImport()`
4. `#if arch()`
5. `if ProcessInfo.processInfo.`
6. `UIDevice.current.userInterfaceIdiom`

## Dependencies
This project depends on the package [swift-issue-reporting](https://github.com/pointfreeco/swift-issue-reporting) (a.k.a.
xctest-dynamic-overlay). When a runtime check is triggered within Xcode, it will show a purple runtime warning, so that you can 
conveniently see exactly which line triggered. 



