import SwiftUI
import UIKit

struct DetailView: UIViewControllerRepresentable {
    let country: Country
    
    func makeUIViewController(context: Context) -> DetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let controller = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            fatalError("Impossible de charger DetailViewController depuis le Storyboard")
        }
        
        controller.country = country
        
        return controller
    }
    
    func updateUIViewController(_ viewController: DetailViewController, context: Context) {
        // Pas de mise à jour nécessaire (vue statique)
    }
}
