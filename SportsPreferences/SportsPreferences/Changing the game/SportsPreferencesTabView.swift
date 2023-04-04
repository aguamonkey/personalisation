//
//  SportsPreferencesTabView.swift
//  SportsPreferences
//
//  Created by Joshua Browne on 04/04/2023.
//

import SwiftUI

struct SportsPreferencesTabView: View {
    
    let selectedSports: [SportsPreference]
    @State private var showingPreferencesSelection = false
    
    var body: some View {
        TabView {
            ForEach(selectedSports, id: \.self) { sport in
                /*@START_MENU_TOKEN@*/Text(sport.name)/*@END_MENU_TOKEN@*/
                    .tabItem {
                        Image(systemName: "sportscourt")
                        Text(sport.name)
                    }
                }
            
            Button(action: {
                showingPreferencesSelection = true
            }) {
                Image(systemName: "gear")
                    .font(.system(size: 25))
            }
            .tabItem {
                Text("Preferences")
            }
            }
            .onAppear {
            UITabBar.appearance().backgroundColor = .white
        }
            .sheet(isPresented: $showingPreferencesSelection) {
                SportsPreferencesSelectionView(viewModel: SportsPreferencesViewModel())
            }
    }
}
