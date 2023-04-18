import SwiftUI
import Firebase

@main
struct SportsPreferencesApp: App {
    @StateObject private var sportsViewModel = SportsViewModel()

    init() {
        FirebaseApp.configure()
        signInAnonymously()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sportsViewModel)
        }
    }

    private func signInAnonymously() {
        if let savedUserID = UserDefaults.standard.string(forKey: "userID") {
            print("Using saved user ID: \(savedUserID)")
        } else {
            Auth.auth().signInAnonymously { authResult, error in
                if let error = error {
                    print("Error signing in anonymously: \(error.localizedDescription)")
                } else if let userID = authResult?.user.uid {
                    print("Successfully signed in anonymously with user ID: \(userID)")
                    UserDefaults.standard.set(userID, forKey: "userID")
                }
            }
        }
    }

}
