//
//  SportsPreferenceViewModel.swift
//  SportsPreferences
//
//  Created by Joshua Browne on 04/04/2023.
//

import SwiftUI

// MARK: ViewModel

final class SportsPreferencesViewModel: ObservableObject {
    @Published var selectedSports: Set<SportsPreference> {
        didSet {
            UserDefaults.standard.set(Array(selectedSports).map(\.name), forKey: "SelectedSports")
        }
    }
    
    init() {
        let savedSports = UserDefaults.standard.array(forKey: "SelectedSports") as? [String] ?? []
        let savedSportsSet = Set(savedSports.compactMap { name in
            SportsPreferences.allSports.first { $0.name == name }
        })
        self.selectedSports = savedSportsSet
    }
    
    func select(_ sport: SportsPreference) {
        if selectedSports.contains(sport) {
            selectedSports.remove(sport)
        } else {
            selectedSports.insert(sport)
        }
    }
}
