//
//  Location.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/04/29.
//

import Foundation
import CoreLocation


struct Location: Identifiable {
    let id: UUID
    let name: String
    var latitude: Double
    var longitude: Double
    let writingId:Int
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let example = Location(id: UUID(), name: "포항공대", latitude: 36.0086, longitude: 129.3532,writingId:-2 )
    
   
}
