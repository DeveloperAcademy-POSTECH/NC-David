//
//  WLocation.swift
//  TodayWalkingIs
//
//  Created by David on 2022/05/07.
//

import Foundation
import MapKit
struct WLocation:Identifiable {
    let id: UUID
    let date:String
    let name:String
    let description:String
    var latitude: Double
    var longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
        
    static let example = WLocation(id: UUID(), date: "2022-05-03- 17시 36분", name: "포항공대", description: "오늘도 세션이 빡쎗다", latitude: 36.0086, longitude: 129.3532)
}

