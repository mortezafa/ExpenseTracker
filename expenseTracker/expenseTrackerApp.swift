//
//  expenseTrackerApp.swift
//  expenseTracker
//

import SwiftUI

@main
struct expenseTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.first?.keyWindow?.backgroundColor = .black
            }
        }
    }
}
