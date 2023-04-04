//
//  SportsViewModel.swift
//  SportsPreferences
//
//  Created by Joshua Browne on 04/04/2023.
//

import SwiftUI
import Combine

class SportsViewModel: ObservableObject {
    @Published var availableSports: [Sport] = [
        Sport(id: 0, name: "Football", iconName: "soccerball"),
        Sport(id: 1, name: "Basketball", iconName: "basketball"),
        Sport(id: 2, name: "Tennis", iconName: "tennisball.fill"),
        Sport(id: 3, name: "Tennis", iconName: "tennisball"),
        Sport(id: 4, name: "Tennis", iconName: "tennisball"),
        Sport(id: 5, name: "Tennis", iconName: "tennisball"),
        Sport(id: 6, name: "Tennis", iconName: "tennisball"),
        Sport(id: 7, name: "Tennis", iconName: "tennisball"),
        Sport(id: 8, name: "Tennis", iconName: "tennisball"),
        Sport(id: 9, name: "Darts", iconName: "tennisball")
        // Add more sports here
    ]
    
    @Published var userSelectedSports: [Sport] = []
    @Published var initialSelectionCompleted: Bool = false
    
    private let userDefaultsKey = "userSelectedSports"
    
    init() {
        loadSelectedSports()
    }

    func selectSport(sport: Sport) {
        if userSelectedSports.contains(sport) {
            userSelectedSports.removeAll { $0.id == sport.id }
        } else if userSelectedSports.count < 3 {
            userSelectedSports.append(sport)
        }
    }
    
    func saveSelectedSports() {
        if let encoded = try? JSONEncoder().encode(userSelectedSports) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
        initialSelectionCompleted = true
    }
    
    func loadSelectedSports() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? JSONDecoder().decode([Sport].self, from: data) {
            userSelectedSports = decoded
            initialSelectionCompleted = true
        }
    }
}

struct Sport: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let iconName: String
}
