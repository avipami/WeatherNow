//
//  LocationManager.swift
//  WeatherNow
//
//  Created by Vincent Palma on 2022-09-19.
//

import Foundation
import CoreLocation


class LocationManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    
    override init() { // This is a subclass
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        self.isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.first?.coordinate
        self.isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        self.isLoading = false
    }
    
}
