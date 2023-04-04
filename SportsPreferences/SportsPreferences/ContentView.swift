//
//  ContentView.swift
//  SportsPreferences
//
//  Created by Joshua Browne on 04/04/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: SportsViewModel
    @State private var showSportsSelection = false
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.systemBackground
    }
    
    var body: some View {
        VStack {
            if !viewModel.initialSelectionCompleted {
                SportsSelectionView(showSportsSelection: $showSportsSelection)
            } else {
                TabView {
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    
                    ForEach(viewModel.userSelectedSports) { sport in
                        SportDetailView(sport: sport)
                            .tabItem {
                                Label(sport.name, systemImage: sport.iconName)
                            }
                    }
                    
                    MoreView()
                        .tabItem {
                            Label("More", systemImage: "ellipsis.circle")
                        }
                }
            }
        }
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SportsViewModel())
    }
}
