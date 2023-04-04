//
//  SportDetailView.swift
//  SportsPreferences
//
//  Created by Joshua Browne on 04/04/2023.
//
import SwiftUI

struct SportDetailView: View {
    let sport: Sport
    
    var body: some View {
        VStack {
            Image(sport.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Text(sport.rawValue)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
        }
    }
}
