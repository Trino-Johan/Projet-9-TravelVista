import SwiftUI

struct CountryRowView: View {
    let countryName: String
    let capital: String
    let imageName: String
    let rate: Int
    
    var body: some View {
        HStack(spacing: 12) {
            // Image circulaire
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            // Textes
            VStack(alignment: .leading, spacing: 4) {
                Text(countryName)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(capital)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Note
            Text("\(rate)")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.orange)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    CountryRowView(
        countryName: "Toto",
        capital: "Lorem Ipsum",
        imageName: "norvege",
        rate: 4
    )
}
