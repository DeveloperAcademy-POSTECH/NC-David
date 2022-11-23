//
//  CoreLocationController.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/07/02.
//

import Foundation
import MapKit
import CoreLocation

class CoreLocation: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // delegation CoreLocation
    
    @Published var region = MKCoordinateRegion(center:MapDetails.startingLocation , span: MapDetails.defaultSpan)
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServiceIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Show an Alert letting the know this is off and to go trun it on")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else {
            return
        }
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("사용자는 현재 접근금지 위치지역에 위치해있습니다.")
        case .denied:
            print("사용자의 위치정보 사용을 거부당했습니다")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location?.coordinate ?? MapDetails.startingLocation, span: MapDetails.defaultSpan)
        @unknown default:
            break
        }

    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
