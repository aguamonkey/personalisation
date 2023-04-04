//
//  SportsPreferenceModel.swift
//  SportsPreferences
//
//  Created by Joshua Browne on 04/04/2023.
//

import SwiftUI

// MARK: Model

struct SportsPreference: Hashable {
    
    let name: String
    let color: Color
    
}

struct SportsPreferences {
    static let allSports: [SportsPreference] = [
        SportsPreference(name: "Football", color: .blue),
        SportsPreference(name: "Basketball", color: .blue),
        SportsPreference(name: "Baseball", color: .blue),
        SportsPreference(name: "Soccer", color: .blue),
        SportsPreference(name: "Tennis", color: .white),
        SportsPreference(name: "Golf", color: .white),
        SportsPreference(name: "Swimming", color: .white),
        SportsPreference(name: "Volleyball", color: .white),
        SportsPreference(name: "Running", color: .white),
        SportsPreference(name: "Cycling", color: .white),
    ]
}
