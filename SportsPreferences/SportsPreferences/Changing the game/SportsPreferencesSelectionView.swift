//
//  SportsPreferencesSelectionView.swift
//  SportsPreferences
//
//  Created by Joshua Browne on 04/04/2023.
//

import SwiftUI

struct SportsPreferencesSelectionView: View {
    
    @ObservedObject var viewModel: SportsPreferencesViewModel
    
    var body: some View {
        VStack {
            Text("Select your favourite sports (up to 3)")
                .font(.title)
                .padding()
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 16) {
                ForEach(SportsPreferences.allSports, id: \.self) { sport in
                    SportsPreferenceView(
                        sport: sport,
                        isSelected: viewModel.selectedSports.contains(sport),
                        action: { viewModel.select(sport) }
                    )
                }
            }
            Spacer()
        }
    }
}


