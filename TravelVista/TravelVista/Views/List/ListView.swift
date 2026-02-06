import SwiftUI

struct ListView: View {
    // Données statiques temporaires (comme demandé dans les consignes)
    let mockRegions = [
        ("Europe", [
            ("Toto", "Lorem", "norvege", 4),
            ("Ipsum", "Dolor", "italie", 3),
            ("Sit", "Amet", "islande", 5)
        ]),
        ("Asie", [
            ("Test", "Ville", "vietnam", 4)
        ])
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(mockRegions, id: \.0) { region in
                    Section(header: Text(region.0)) {
                        ForEach(region.1, id: \.0) { country in
                            CountryRowView(
                                countryName: country.0,
                                capital: country.1,
                                imageName: country.2,
                                rate: country.3
                            )
                        }
                    }
                }
            }
            .navigationTitle("Liste de voyages")
        }
    }
}

#Preview {
    ListView()
}
