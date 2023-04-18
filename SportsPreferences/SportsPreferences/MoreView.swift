import SwiftUI

struct MoreView: View {
    @EnvironmentObject var viewModel: SportsViewModel
    @State private var showSportsSelection = false

    var body: some View {
        VStack {
            Text("More")
                .font(.largeTitle)
            
            Button("Update Sports Preferences") {
                showSportsSelection = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(8)
        }
        .sheet(isPresented: $showSportsSelection) {
            SportsSelectionView(showSportsSelection: $showSportsSelection)
                .environmentObject(viewModel)
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
            .environmentObject(SportsViewModel())
    }
}
