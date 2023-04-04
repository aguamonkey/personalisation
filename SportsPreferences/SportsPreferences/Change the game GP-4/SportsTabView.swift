//
//  SportsTabView.swift
//  SportsPreferences
//
//  Created by Joshua Browne on 04/04/2023.
//

import SwiftUI

struct SportsTabView: View {
    @EnvironmentObject var viewModel: SportsViewModel
    
    var body: some View {
        TabView {
            ForEach(viewModel.selectedSports, id: \.self) { sport in
                Text("Content for \(sport)")
                    .tabItem {
                        Text(sport)
                        Image(systemName: viewModel.getIconName(for: sport))
                    }
            }
        }
    }
}

struct SportsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SportsTabView()
            .environmentObject(SportsViewModel())
    }
}
