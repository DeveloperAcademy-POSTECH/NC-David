//
//  CoreLocationController.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/07/02.
//

import Foundation
import MapKit
import CoreLocation

enum MapDetails {
    static let defaultLocation = CLLocationCoordinate2D(latitude: 37.5511, longitude: 126.9882)
    static let mapMagnitude = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    
}

class CoreLocation: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center:MapDetails.defaultLocation , span: MapDetails.mapMagnitude)

    var locationManager: CLLocationManager?
    // TODO: Location 탐지하는동안 MainThread 탐지되는동안 UI멈추는 이슈 존재함
    func checkLocation() {
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager = CLLocationManager()
            self.locationManager!.delegate = self
        } else {
            print("외부환경 또는 기기의 문제가 발생하여 위치정보를 확인할수 없습니다")
        }
    }
    
    
    
    // TODO: 프린트문말고 오류메시지 문구를 확인할수있는 Alert구현
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
            region = MKCoordinateRegion(center: locationManager.location?.coordinate ?? MapDetails.defaultLocation, span: MapDetails.mapMagnitude)
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
