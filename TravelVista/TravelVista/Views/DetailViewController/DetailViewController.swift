//
//  DetailViewController.swift
//  TravelVista
//
//  Created by Amandine Cousin on 18/12/2023.
//

import UIKit
import MapKit
import SwiftUI

class DetailViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var capitalNameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var embedMapView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var rateView: UIView!
    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setCustomDesign()

        if let country = self.country {
            self.setUpData(country: country)
        }
    }
    
    private func setUpData(country: Country) {
        self.title = country.name
        
        self.setupSwiftUITitleView(country: country)
        
        self.imageView.image = UIImage(named: country.pictureName )
        self.descriptionTextView.text = country.description
        
        self.setMapLocation(lat: self.country?.coordinates.latitude ?? 28.394857,
                            long: self.country?.coordinates.longitude ?? 84.124008)
    }
    
    private func setupSwiftUITitleView(country: Country) {
        // 1. Crée vue SwiftUI
        let swiftUIView = TitleViewSwiftUI(
            countryName: country.name,
            capitalName: country.capital,
            rate: country.rate
        )
        
        // 2. Enveloppe dans UIHostingController
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        // 3. Ajoute le controller
        addChild(hostingController)
        
        // 4. Ajoute la vue au titleView
        titleView.addSubview(hostingController.view)
        
        // 5. Configure les contraintes AutoLayout
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: titleView.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: titleView.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: titleView.trailingAnchor)
        ])
        
        // 6. Notifie que le controller a été ajouté
        hostingController.didMove(toParent: self)
    }

    
    private func setCustomDesign() {
        self.mapView.layer.cornerRadius = self.mapView.frame.size.width / 2
        self.embedMapView.layer.cornerRadius = self.embedMapView.frame.size.width / 2
        self.mapButton.layer.cornerRadius = self.mapButton.frame.size.width / 2
        
        self.mapView.layer.borderColor = UIColor(named: "CustomSand")?.cgColor
        self.mapView.layer.borderWidth = 2
    }
    
    private func setMapLocation(lat: Double, long: Double) {
        let initialLocation = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let span = MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        let region = MKCoordinateRegion(center: initialLocation, span: span)
        self.mapView.setRegion(region, animated: true)
        self.mapView.delegate = self
    }
    
    
    // Cette fonction est appelée lorsque la carte est cliquée
    // Elle permet d'afficher un nouvel écran qui contient une carte
    @IBAction func showMap(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController: MapViewController = storyBoard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        nextViewController.setUpData(capitalName: self.country?.capital, lat: self.country?.coordinates.latitude ?? 28.394857, long: self.country?.coordinates.longitude ?? 84.124008)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
