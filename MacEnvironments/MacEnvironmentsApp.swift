//
//  MacEnvironmentsApp.swift
//  MacEnvironments
//
//  Created by Daniel Lyons on 2024-08-28.
//

import IssueReporting
import SwiftUI

@main
struct MacEnvironmentsApp: App {
    var body: some Scene {
        WindowGroup {
            Text("MacEnvironmentsApp")
#if os(macOS)
                .onAppear {
                    reportIssue("#if os(macOS)")
                    if ProcessInfo.processInfo.isMacCatalystApp {
                        reportIssue("ProcessInfo.processInfo.isMacCatalystApp")
                    }
                    if ProcessInfo.processInfo.isiOSAppOnMac {
                        reportIssue("ProcessInfo.processInfo.isiOSAppOnMac")
                    }
                    
                    // 🔴 UIDevice not available here
                    //              switch UIDevice.current.userInterfaceIdiom {
                    //                case .pad, .mac, .phone: reportIssue()
                    //                default: reportIssue()
                    //              }
                    
                }
#elseif os(iOS)
                .onAppear {
                    reportIssue("#if os(iOS)")
                    if ProcessInfo.processInfo.isMacCatalystApp {
                        reportIssue("ProcessInfo.processInfo.isMacCatalystApp")
                    }
                    if ProcessInfo.processInfo.isiOSAppOnMac {
                        reportIssue("ProcessInfo.processInfo.isiOSAppOnMac")
                    }
                    
                    switch UIDevice.current.userInterfaceIdiom {
                            // by default Catalyst apps will use .pad
                        case .pad: reportIssue("UIDevice.current.userInterfaceIdiom.pad")
                            // To use .mac, in your Catalyst target, go to Project > [Catalyst Target] > General > Deployment Info > Mac Catalyst Interface and set it to "Optimize for Mac"
                        case .mac: reportIssue("UIDevice.current.userInterfaceIdiom.mac")
                        default: reportIssue()
                    }
                }
#endif
            
#if targetEnvironment(macCatalyst)
                .onAppear {
                    reportIssue("#if targetEnvironment(macCatalyst)")
                }
#endif
            
#if targetEnvironment(simulator)
                .onAppear{
                    reportIssue("targetEnvironment(simulator)")
                }
#endif
            
#if canImport(UIKit)
                .onAppear { reportIssue("#if canImport(UIKit)") }
#endif
            
#if canImport(AppKit)
                .onAppear { reportIssue("#if canImport(AppKit)") }
#endif
            
#if arch(x86_64)
                .onAppear{
                    reportIssue("arch(x86_64)")
                }
#endif
            
#if arch(arm64)
                .onAppear {
                    reportIssue("arch(arm64)")
                }
#endif
        }
    }
}
