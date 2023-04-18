import SwiftUI
import Combine

class SportsViewModel: ObservableObject {
    private let firestoreService = FirestoreService()

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

        // Update Firestore with user's sports preferences
        firestoreService.trackUserPreferences(userPreferences: userSelectedSports) { result in
            switch result {
            case .success:
                print("Successfully updated user sports preferences in Firestore.")
            case .failure(let error):
                print("Error updating user sports preferences in Firestore: \(error)")
            }
        }
    }

    
    func loadSelectedSports() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? JSONDecoder().decode([AvailableSport].self, from: data) {
            userSelectedSports = decoded
            initialSelectionCompleted = true
        }
    }
}
