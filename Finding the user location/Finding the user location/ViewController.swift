//
//  ViewController.swift
//  Finding the user location
//
//  Created by sneakysneak on 03/02/2019.
//  Copyright © 2019 sneakysneak. All rights reserved.
//

//In build phases link binary with libraries and add CoreLocation framework
//In info plist set up get user's location

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //allows the viewController to control the location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
//        print(locations)
        
        let userLocation: CLLocation = locations[0]
        
//        let latitude = userLocation.coordinate.latitude
//
//        let longitude = userLocation.coordinate.longitude
//
//        let latDelta: CLLocationDegrees = 0.05
//
//        let lonDelta: CLLocationDegrees = 0.05
//
//        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
//
//        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//
//        let region = MKCoordinateRegion(center: location, span: span)
//
//        self.map.setRegion(region, animated: true)
        
        // Debug and choose a proper location in order to list the address details
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            
            if (error != nil) {
                
                print(error)
                
            } else {
                
                if let placemark = placemarks?[0] {
                    
                    var subThoroughFare = ""
                    
                    if placemark.subThoroughfare != nil {
                        
                        subThoroughFare = placemark.subThoroughfare!
                        
                    }
                    
                    var thoroughfare = ""
                    
                    if placemark.thoroughfare != nil {
                        
                        thoroughfare = placemark.thoroughfare!
                    }
                    
                    var subLocality = ""
                    
                    if placemark.subLocality != nil {
                        
                        subLocality = placemark.subLocality!
                    }
                    
                    var subAdministrtiveArea = ""
                    
                    if placemark.subAdministrativeArea != nil {
                        
                        subAdministrtiveArea = placemark.subAdministrativeArea!
                    }
                    
                    var postalCode = ""
                    
                    if placemark.postalCode != nil {
                        
                        postalCode = placemark.postalCode!
                    }
                    
                    var country = ""
                    
                    if placemark.country != nil {
                        
                        country = placemark.country!
                    }
                    
                    print(subThoroughFare + thoroughfare + "\n" + subLocality + "\n" + subAdministrtiveArea
                     + "\n" + postalCode + "\n" + country)
                }
            }
        }
    }
}

