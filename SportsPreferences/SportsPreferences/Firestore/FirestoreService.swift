//
//  FirestoreService.swift
//  SportsPreferences
//
//  Created by Joshua Browne on 18/04/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirestoreService {
    private let db = Firestore.firestore()
    
    func trackUserPreferences(userPreferences: [AvailableSport], completion: @escaping (Result<Void, Error>) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(.failure(NSError(domain: "No user ID found", code: -1, userInfo: nil)))
            return
        }
        
        let docRef = db.collection("users").document(userId).collection("sportsPreferences").document("preferences")
        
        let preferenceNames: [String] = userPreferences.map {$0.name}
        
        docRef.setData(["preferences": preferenceNames]) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
