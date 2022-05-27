//
//  LocationManager.swift
//  BikeStationsIOS
//
//  Created by Anoop on 5/27/22.
//

import Foundation
import MapKit
import CoreLocation

class LocationManager : NSObject, CLLocationManagerDelegate, ObservableObject{
    

    @Published var location: CLLocation?

    var hasSetRegion = false
    private let manager = CLLocationManager()

    @Published var locationPermissionDenied = false

    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 38.898150, longitude: -77.034340),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    )

    // Checking authorization status...
    
    override init() {
                super.init()
                manager.delegate = self
                manager.desiredAccuracy = kCLLocationAccuracyBest
                manager.requestWhenInUseAuthorization()
                manager.startUpdatingLocation()
            }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {

        switch manager.authorizationStatus {

        case .denied :
            // Alert
            locationPermissionDenied = true
            print("Denied")
            print(locationPermissionDenied)

        case .restricted:
            print("restricted")

        case .notDetermined:
            // Request
            print("not Determined")
            manager.requestWhenInUseAuthorization()

        case .authorizedWhenInUse :
            print("Authorized when in use")
            manager.allowsBackgroundLocationUpdates = true
            manager.startUpdatingLocation()

        default:
            print("Default")
        }

    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error : Error){
        print("Error: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if let location = locations.last {
            self.location = location

            if hasSetRegion == false{
                region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
                hasSetRegion = true
                manager.stopUpdatingLocation()
            }
        }
    }
}
