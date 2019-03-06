//
//  MapViewController.swift
//  MapGuide
//
//  Created by Nugumanov Dmitry on 2/13/19.
//  Copyright © 2019 Nugumanov Dmitry. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation
import RealmSwift

class MapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var googleMaps: GMSMapView!
    
    private var infoWindow = MapMarkerWindow()
    fileprivate var locationMarker: GMSMarker? = GMSMarker()
    
    var locationManager = CLLocationManager()
    var states = [StateModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoWindow = loadNib()
        self.loadStatesData()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoringSignificantLocationChanges()
        
        let camera = GMSCameraPosition.camera(withLatitude: 47.824952, longitude: 35.090359, zoom: 13)
        
        self.googleMaps.camera = camera
        self.googleMaps.delegate = self
        self.googleMaps.isMyLocationEnabled = true
        self.googleMaps.settings.myLocationButton = true
        self.googleMaps.settings.compassButton = true
        self.googleMaps.settings.zoomGestures = true
        
        
        testPins()

    }
    
    func testPins() {

        for pins in states {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: pins.latitude, longitude: pins.longitute)
            
//            marker.icon = UIImage(named: "settings")
            marker.map = self.googleMaps
        }
        
    }
    
    private func loadStatesData() {
        let realmInstance = try! Realm()
        var states = [StateModel]()
        for state in realmInstance.objects(StateModel.self) {
            states.append(state)
            
        }
        self.states = states
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        let location: CLLocation? = googleMaps.myLocation
        if location != nil {
            googleMaps.animate(toLocation: (location?.coordinate)!)
        }
       return true
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        
        let infoWindow = Bundle.main.loadNibNamed("MapMarkerWindowView", owner: self.googleMaps, options: nil)?.first as! MapMarkerWindow
        
        marker.infoWindowAnchor = CGPoint(x: 0.5, y: 0.5)
        
        for name in states {
            if marker.position.latitude == name.latitude && marker.position.longitude == name.longitute {
                infoWindow.titleMarkerLabel.text = name.name
                infoWindow.descriptionMarkerLabel.text = name.name
                
            }
        }
        return infoWindow
    }
    
    func loadNib() -> MapMarkerWindow {
        let infoWindow = MapMarkerWindow.instanceFromNib() as! MapMarkerWindow
        return infoWindow
    }
    // MARK: GMSMapViewDelegate
    
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
    }
    

    
   
}

