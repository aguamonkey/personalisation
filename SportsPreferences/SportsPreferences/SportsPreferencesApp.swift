//
//  SportsPreferencesApp.swift
//  SportsPreferences
//
//  Created by Joshua Browne on 04/04/2023.
//

import SwiftUI

@main
struct SportsPreferencesApp: App {
    @StateObject private var sportsViewModel = SportsViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sportsViewModel)
        }
    }
}
