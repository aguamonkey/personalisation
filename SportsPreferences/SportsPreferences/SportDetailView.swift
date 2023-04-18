//
//  SportDetailView.swift
//  SportsPreferences
//
//  Created by Joshua Browne on 04/04/2023.
//

import SwiftUI

struct SportDetailView: View {
    var sport: AvailableSport

    var body: some View {
        VStack {
            Text(sport.name)
                .font(.largeTitle)
        }
    }
}

struct SportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SportDetailView(sport: AvailableSport(id: 0, name: "Soccer", iconName: "soccer"))
    }
}
