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


class MapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var googleMaps: GMSMapView!
    
    private var infoWindow = MapMarkerWindow()
    fileprivate var locationMarker: GMSMarker? = GMSMarker()
    
    var locationManager = CLLocationManager()
    var currentPlace = CLLocationCoordinate2D()
    
    let rest = Restaurants()
    
//    let pinsArray = [State(lat: 47.8171141648544, long: 35.088985562324524),
//                     State(lat: 47.82057216443656, long: 35.09705364704132),
//                     State(lat: 47.824952, long: 35.090359),
//                     State(lat: 47.83031095861402, long: 35.07190525531769)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoWindow = loadNib()
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
//
//        marker.position = CLLocationCoordinate2D(latitude: 47.824952, longitude: 35.090359)
//        marker.map = self.googleMaps
//
//        let marker2 = GMSMarker()
//        marker2.position = CLLocationCoordinate2D(latitude: 48.024952, longitude: 35.990359)
//        marker2.map = self.googleMaps
//
//        let marker3 = GMSMarker()
//        marker3.position = CLLocationCoordinate2D(latitude: 48.524952, longitude: 36.490359)
//        marker3.map = self.googleMaps
    }
    
    func testPins() {
        for pins in rest.restsArray {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: pins.lat, longitude: pins.long)
            marker.icon = UIImage(named: "settings")
            marker.map = self.googleMaps
        }
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
        infoWindow.markerImageView.image = UIImage(named: "station")
        infoWindow.markerImageView.contentMode = .scaleAspectFit
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

