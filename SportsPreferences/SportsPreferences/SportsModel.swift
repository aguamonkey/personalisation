//
//  SportsModel.swift
//  SportsPreferences
//
//  Created by Joshua Browne on 18/04/2023.
//

import SwiftUI

struct AvailableSport: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let iconName: String
    
    func dictionaryRepresentation() -> [String: Any] {
        return [
            "id": id,
            "name": name,
            "iconName": iconName
        ]
    }
}

enum Sports: Int, CaseIterable {
    case football
    case basketball
    case racing
    case tennis
    case boxing
    case cricket
    case golf
    case snooker
    case nfl
    case darts

    var sport: AvailableSport {
        switch self {
        case .football:
            return AvailableSport(id: rawValue, name: "Football", iconName: "figure.soccer")
        case .basketball:
            return AvailableSport(id: rawValue, name: "Basketball", iconName: "figure.basketball")
        case .racing:
            return AvailableSport(id: rawValue, name: "Racing", iconName: "figure.walk.motion")
        case .tennis:
            return AvailableSport(id: rawValue, name: "Tennis", iconName: "figure.tennis")
        case .boxing:
            return AvailableSport(id: rawValue, name: "Boxing", iconName: "figure.boxing")
        case .cricket:
            return AvailableSport(id: rawValue, name: "Cricket", iconName: "figure.cricket")
        case .golf:
            return AvailableSport(id: rawValue, name: "Golf", iconName: "figure.golf")
        case .snooker:
            return AvailableSport(id: rawValue, name: "Snooker", iconName: "figure.fishing")
        case .nfl:
            return AvailableSport(id: rawValue, name: "NFL", iconName: "figure.american.football")
        case .darts:
            return AvailableSport(id: rawValue, name: "Darts", iconName: "figure.archery")
        }
    }
}

class SportsData: ObservableObject {
    @Published var availableSports: [AvailableSport] = Sports.allCases.map { $0.sport }
}

