//
//  Constants.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/06/03.
//

import Foundation


class Constants {
    
    static let dates = ["2022-05-12 11:24", "2022-05-07 11:24", "2022-05-07 11:24", "2022-05-07 11:24"]
    static let names = ["호미곶", "송도해수욕장", "영일대해수욕장", "포항시외버스터미널"]
    static let descriptions = ["호미곶 가고싶은곳이다..","송도해수욕장에 바닷바람이 엄청쌘다.. 사람이 엄청많구나..", "영일대해수욕장에서 바다구경을하고 물회에 밥도 말아먹었다", "포항시외버스터미널에 있는 홈플러스에 CGV에 방문해서 소닉2를 보았다"]
    static let latitudes = [36.0808,36.0347,36.0561,36.0135]
                                
    static var longitudes = [129.5554,129.3806,129.3781,129.3497
                                ]
    static let userDefaultKey = "WLocation"
    
    static let userDefaultObjects = [
    WLocation(id: UUID(), date: "2022-05-12 11:24", name: "호미곶", description: "호미곶 가고싶은곳이다..", latitude: 36.0808, longitude: 129.5554),
    WLocation(id: UUID(), date: "2022-05-07 11:24", name: "송도해수욕장", description: "송도해수욕장에 바닷바람이 엄청쌘다.. 사람이 엄청많구나..", latitude: 36.0347, longitude: 129.3806),
    WLocation(id: UUID(), date: "2022-05-07 11:24", name: "영일대해수욕장", description: "영일대해수욕장에서 바다구경을하고 물회에 밥도 말아먹었다", latitude: 36.0561, longitude: 129.3781),
    WLocation(id: UUID(), date: "2022-05-07 11:24", name: "포항시외버스터미널", description: "포항시외버스터미널에 있는 홈플러스에 CGV에 방문해서 소닉2를 보았다", latitude: 36.0135, longitude: 129.3497)
    ]
}
