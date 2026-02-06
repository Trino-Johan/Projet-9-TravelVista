import SwiftUI

struct CountryRowView: View {
    let country: Country
    
    var body: some View {
        HStack(spacing: 12) {
            // Image circulaire
            Image(country.pictureName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            // Textes
            VStack(alignment: .leading, spacing: 4) {
                Text(country.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(country.capital)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Note
            Text("\(country.rate)")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.orange)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    let mockCountry = Country(
        name: "France",
        capital: "Paris",
        description: "Test",
        rate: 5,
        pictureName: "france",
        coordinates: Coordinates(latitude: 48.8566, longitude: 2.3522)
    )
    
    CountryRowView(country: mockCountry)
}
