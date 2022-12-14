//
//  Location.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/04/29.
//

import Foundation
import CoreLocation
import UIKit


class Write: Identifiable{
    let id: UUID
    let title: String
    let description: String
    let date: Date
    let image: UIImage?
    let longitude: Double
    let latitude: Double
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    
    init(title: String, description: String, image: UIImage, longitude: Double, latitude: Double) {
        self.id = UUID()
        self.title = title
        self.date = Date()
        self.description = description
        self.image = image
        self.longitude = longitude
        self.latitude = latitude
    }
    
    static let writedatas = [
        Write(title: "타이틀1", description: "본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문본문", image: UIImage(named: "image1")!, longitude: 36.0086, latitude: 129.3532 )
    ]
}

