import Foundation

class ListViewModel: ObservableObject {
    @Published var regions: [Region] = []
    
    init() {
        loadData()
    }
    
    private func loadData() {
        regions = Service().load("Source.json")
    }
}
