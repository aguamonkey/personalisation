//
//  SportsViewModel.swift
//  SportsPreferences
//
//  Created by Joshua Browne on 04/04/2023.
//

import SwiftUI
import Combine

class SportsViewModel: ObservableObject {
    @Published var showSelectionScreen: Bool
    @Published var allSports: [String] = [
        "Soccer", "Basketball", "Baseball", "Tennis", "Volleyball", "Cricket", "Rugby", "Golf", "Hockey", "Swimming"
    ]
    @Published var selectedSports: [String] = []

    private var cancellables = Set<AnyCancellable>()

    init() {
        showSelectionScreen = UserDefaults.standard.array(forKey: "selectedSports") == nil
        if let savedSports = UserDefaults.standard.array(forKey: "selectedSports") as? [String] {
            selectedSports = savedSports
        }
        
        $selectedSports
            .sink { [weak self] sports in
                guard let self = self else { return }
                if sports.count >= 3 {
                    self.allSports = self.allSports.filter { sports.contains($0) }
                } else {
                    self.allSports = self.allSports.(sports).sorted()
                }
            }
            .store(in: &cancellables)
    }

    func toggleSportSelection(sport: String) {
        if selectedSports.contains(sport) {
            selectedSports.removeAll { $0 == sport }
        } else {
            if selectedSports.count < 3 {
                selectedSports.append(sport)
            }
        }
    }

    func saveSelectedSports() {
        UserDefaults.standard.set(selectedSports, forKey: "selectedSports")
        showSelectionScreen = false
    }

    func getIconName(for sport: String) -> String {
        switch sport {
        case "Soccer":
            return "sportscourt"
        case "Basketball":
            return "basketball"
        case "Baseball":
            return "baseball"
        case "Tennis":
            return "tennis"
        case "Volleyball":
            return "volleyball"
        case "Cricket":
            return "cricket"
        case "Rugby":
            return "rugby"
        case "Golf":
            return "golf"
        case "Hockey":
            return "hockey"
        case "Swimming":
            return "swimming"
        default:
            return "questionmark"
        }
    }
}
