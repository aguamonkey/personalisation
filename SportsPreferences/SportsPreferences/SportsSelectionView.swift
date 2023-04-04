//
//  SportsSelectionView.swift
//  SportsPreferences
//
//  Created by Joshua Browne on 04/04/2023.
//

import SwiftUI

struct SportsSelectionView: View {
    @EnvironmentObject var viewModel: SportsViewModel
    @Binding var showSportsSelection: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Select up to 3 sports")
                    .font(.title)
                    .padding(.top)
                
                ScrollView {
                    let columns: [GridItem] = [
                        GridItem(.fixed(100), spacing: 50),
                        GridItem(.fixed(100), spacing: 50)
                    ]
                    
                    LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
                        ForEach(viewModel.availableSports) { sport in
                            SportSelectionCell(sport: sport, isSelected: viewModel.userSelectedSports.contains(sport))
                                .onTapGesture {
                                    viewModel.selectSport(sport: sport)
                                }
                        }
                    }
                    .padding()
                }
                
                Spacer()
                
                Button("Done") {
                    showSportsSelection = false
                    viewModel.saveSelectedSports()
                }
                .disabled(viewModel.userSelectedSports.count == 0)
                .padding()
            }
            .navigationBarTitle("Sports Preferences", displayMode: .inline)
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}

struct SportSelectionCell: View {
    var sport: Sport
    var isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: sport.iconName)
                .font(.system(size: 40))
                .foregroundColor(isSelected ? .blue : .gray)
            Text(sport.name)
                .font(.headline)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(width: 120, height: 120)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 4)
    }
}

struct SportsSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SportsSelectionView(showSportsSelection: .constant(true)).environmentObject(SportsViewModel())
    }
}
