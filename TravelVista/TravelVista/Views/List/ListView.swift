import SwiftUI

struct ListView: View {
    @StateObject private var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.regions, id: \.name) { region in
                    Section(header: Text(region.name)) {
                        ForEach(region.countries, id: \.name) { country in
                            NavigationLink(destination: DetailView(country: country)) {
                                CountryRowView(country: country)
                            }
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
