

import SwiftUI

struct SportsPreferenceView: View {
    let sport: SportsPreference
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(sport.name)
                .foregroundColor(sport.color == .white ? .black : .white)
                .padding()
                .background(isSelected ? sport.color : Color.white) // Set background color based on isSelected
                .cornerRadius(8)
        }
        .opacity(isSelected ? 1 : 0.5)
    }
}
