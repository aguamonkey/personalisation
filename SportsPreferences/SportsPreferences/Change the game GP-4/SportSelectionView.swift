import SwiftUI

struct SportsSelectionView: View {
    @EnvironmentObject var viewModel: SportsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Select up to 3 sports:")
                    .font(.title)
                
                List(viewModel.allSports, id: \.self) { sport in
                    Button(action: {
                        viewModel.toggleSportSelection(sport: sport)
                    }) {
                        HStack {
                            Text(sport)
                            Spacer()
                            if viewModel.selectedSports.contains(sport) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .foregroundColor(.black)
                }
                
                Spacer()
                
                Button(action: {
                    viewModel.saveSelectedSports()
                }) {
                    Text("Save and Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.bottom)
                .disabled(viewModel.selectedSports.count == 0)
            }
            .navigationTitle("Sports Preferences")
        }
    }
}

struct SportsSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SportsSelectionView()
            .environmentObject(SportsViewModel())
    }
}
