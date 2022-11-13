

import Foundation
import SwiftUI



class PersisData {
    
    init() {
//        WLoation
//        let id: UUID
//        let date:String
//        let name:String
//        let description:String
//        var latitude: Double
//        var longitude: Double
//        var coordinate: CLLocationCoordinate2D {
//            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let persisData = UserDefaults.standard
        var wLocations = [WLocation(id: UUID(), date: "2022-05-07 11:24", name: "포항장소5", description: "포항장소5에 뭔가를했다", latitude: 36.0912, longitude: 129.3923),
        WLocation(id: UUID(), date: "2022-05-08 11:24", name: "포항장소6", description: "포항장소6에 뭔가를했다", latitude: 36.0853, longitude: 129.3814),
        WLocation(id: UUID(), date: "2022-05-09 11:24", name: "포항장소7", description: "포항장소7에 뭔가를했다", latitude: 36.0534, longitude: 129.3234),
        WLocation(id: UUID(), date: "2022-05-10 11:24", name: "포항장소8", description: "포항장소8에 뭔가를했다", latitude: 36.0333, longitude: 129.3134),
        WLocation(id: UUID(), date: "2022-05-11 11:24", name: "포항장소9", description: "포항장소9에 뭔가를했다", latitude: 36.0234, longitude: 129.4312),
        WLocation(id: UUID(), date: "2022-05-12 11:24", name: "호미곶", description: "호미곶 가고싶은곳이다..", latitude: 36.0808, longitude: 129.5554),
        WLocation(id: UUID(), date: "2022-05-07 11:24", name: "송도해수욕장", description: "송도해수욕장에 바닷바람이 엄청쌘다.. 사람이 엄청많구나..", latitude: 36.0347, longitude: 129.3806),
        WLocation(id: UUID(), date: "2022-05-07 11:24", name: "영일대해수욕장", description: "영일대해수욕장에서 바다구경을하고 물회에 밥도 말아먹었다", latitude: 36.0561, longitude: 129.3781),
        WLocation(id: UUID(), date: "2022-05-07 11:24", name: "포항시외버스터미널", description: "포항시외버스터미널에 있는 홈플러스에 CGV에 방문해서 소닉2를 보았다", latitude: 36.0135, longitude: 129.3497),]
//        }
        persisData.set(wLocations, forKey: "wLocation")
        
    }
    
    static func findPath() {
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
    }


    
//    defaults.set(true, forKey:"MusicOn")
//    defaults.set("Angela", forKey:"PlayerName")
//    defaults.set(Date(), forKey:"AppLastOpenedByUser")
//
//    let array = [1, 2, 3]
//    defaults.set(array, forKey: "myArray")
//    let dictionary = ["Name": "Angela"]
//    defaults.set(dictionary, forKey: "myDictionary")
//
//    let volume = defaults.float(forKey: "Volume")
//    let appLastOpen = defaults.object(forKey: "AppLastOpenedByUser")
//    let myArray = defaults.array(forKey: "myArray") as! [Int]
//    let myDictionaory = defaults.dictionary(forKey: "myDictionary")

}
