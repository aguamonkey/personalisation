import SwiftUI
import Combine

class SportsViewModel: ObservableObject {
    @Published var availableSports: [AvailableSport] = Sports.allCases.map { $0.sport }
    @Published var userSelectedSports: [AvailableSport] = []
    @Published var initialSelectionCompleted: Bool = false
    
    private let userDefaultsKey = "userSelectedSports"
    
    init() {
        loadSelectedSports()
    }

    func selectSport(sport: AvailableSport) {
        if userSelectedSports.contains(where: { $0.id == sport.id }) {
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
           let decoded = try? JSONDecoder().decode([AvailableSport].self, from: data) {
            userSelectedSports = decoded
            initialSelectionCompleted = true
        }
    }
}
