
import Foundation
import SwiftUI
import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 36.012831, longitude: 129.3251)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
}
class WLocationController:ObservableObject{
    
    @Published var wLocations = [
        WLocation(id: UUID(), date: "2022-05-07 11:24", name: "포항장소5", description: "포항장소5에 뭔가를했다", latitude: 36.0912, longitude: 129.3923),
        WLocation(id: UUID(), date: "2022-05-08 11:24", name: "포항장소6", description: "포항장소6에 뭔가를했다", latitude: 36.0853, longitude: 129.3814),
        WLocation(id: UUID(), date: "2022-05-09 11:24", name: "포항장소7", description: "포항장소7에 뭔가를했다", latitude: 36.0534, longitude: 129.3234),
        WLocation(id: UUID(), date: "2022-05-10 11:24", name: "포항장소8", description: "포항장소8에 뭔가를했다", latitude: 36.0333, longitude: 129.3134),
        WLocation(id: UUID(), date: "2022-05-11 11:24", name: "포항장소9", description: "포항장소9에 뭔가를했다", latitude: 36.0234, longitude: 129.4312),
        WLocation(id: UUID(), date: "2022-05-12 11:24", name: "호미곶", description: "호미곶 가고싶은곳이다..", latitude: 36.0808, longitude: 129.5554),
        WLocation(id: UUID(), date: "2022-05-07 11:24", name: "송도해수욕장", description: "송도해수욕장에 바닷바람이 엄청쌘다.. 사람이 엄청많구나..", latitude: 36.0347, longitude: 129.3806),
        WLocation(id: UUID(), date: "2022-05-07 11:24", name: "영일대해수욕장", description: "영일대해수욕장에서 바다구경을하고 물회에 밥도 말아먹었다", latitude: 36.0561, longitude: 129.3781),
        WLocation(id: UUID(), date: "2022-05-07 11:24", name: "포항시외버스터미널", description: "포항시외버스터미널에 있는 홈플러스에 CGV에 방문해서 소닉2를 보았다", latitude: 36.0135, longitude: 129.3497),
        
        
    ]
    func writeDiary(addWLocation:WLocation) {
        wLocations.append(addWLocation)
    }
    
    func openDiary(wLocation:WLocation) -> WLocation {
        if let matchWLocation = wLocations.first(where: {$0.latitude == wLocation.latitude}) {
            return matchWLocation
        } else {
            return wLocations[0]
        }
    }
}
class CoreLocationController: NSObject, ObservableObject, CLLocationManagerDelegate {
    
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
