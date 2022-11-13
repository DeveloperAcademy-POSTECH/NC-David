//
//  LocationController.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/07/02.

import Foundation
import SwiftUI
import CoreLocation
import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 36.012831, longitude: 129.3251)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
}


class LocationController:ObservableObject{
    // Testing Data
    var dateArray = Constants.dates
    var nameArray = Constants.names
    var descriptionArray = Constants.descriptions
    var latitudeArray = Constants.latitudes
    
    var longitudeArray = Constants.longitudes
    
    var userDefaultObjecjtArray:[WLocation] = Constants.userDefaultObjects
    
    
    @Published var wLocations:[WLocation] = []
    
    
    
    init() {
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        if let dateArrayItem = UserDefaults.standard.array(forKey: "DateArray") as? [String] {
            dateArray = dateArrayItem
        }
        if let nameArrayItem = UserDefaults.standard.array(forKey: "NameArray") as? [String] {
            nameArray = nameArrayItem
        }
        if let descriptionArrayItem = UserDefaults.standard.array(forKey: "DescriptionArray") as? [String] {
            descriptionArray = descriptionArrayItem
        }
        if let latitudeArrayItem = UserDefaults.standard.array(forKey: "LatitudeArray") as? [Double] {
            latitudeArray = latitudeArrayItem
        }
        if let longitudeArrayItem = UserDefaults.standard.array(forKey: "LongitudeArray") as? [Double] {
            longitudeArray = longitudeArrayItem
        }
        loadData()
        
        if let retriveuserDefaultObject = UserDefaults.standard.userDefaultObject(dataType: WLocation.self, key: "addNewObject") {
            print(retriveuserDefaultObject.name)
            print(retriveuserDefaultObject.description)
        }
        
    }
    
    
    
//    @Published var wLocations = [for wLocationsin]
    func writeDiary(addWLocation:WLocation) {
        wLocations.append(addWLocation)
        dateArray.append(addWLocation.date)
        nameArray.append(addWLocation.name)
        descriptionArray.append(addWLocation.description)
        latitudeArray.append(addWLocation.longitude)
        longitudeArray.append(addWLocation.latitude)
        setData()
        let wLocationData = WLocation(id: UUID(), date: addWLocation.date, name: addWLocation.name, description: addWLocation.description, latitude: addWLocation.latitude, longitude: addWLocation.longitude)
        UserDefaults.standard.setUserDefaultObject(wLocationData, forKey: "addNewObject")
    }
    
    func openDiary(wLocation:WLocation) -> WLocation {
        if let matchWLocation = wLocations.first(where: {$0.latitude == wLocation.latitude}) {
            return matchWLocation
        } else {
            return wLocations[0]
        }
    }
    
    
    func loadData() {
        for i in 0...dateArray.count - 1 {
            wLocations.append(WLocation(id: UUID(), date: dateArray[i], name: nameArray[i], description: descriptionArray[i], latitude: latitudeArray[i], longitude: longitudeArray[i]))
        }
    }
    
    func setData() {
        UserDefaults.standard.set(self.dateArray, forKey: "DateArray")
        UserDefaults.standard.set(self.nameArray, forKey: "NameArray")
        UserDefaults.standard.set(self.descriptionArray, forKey: "DescriptionArray")
        UserDefaults.standard.set(self.latitudeArray, forKey: "LatitudeArray")
        UserDefaults.standard.set(self.longitudeArray, forKey: "LongitudeArray")
    }
    
    func loadObject() {
        
    }
    
    func setObject() {
        
    }
}



extension UserDefaults {
    func setUserDefaultObject<T: Codable>(_ data: T?, forKey defaultName:String) {
        let encoded = try? JSONEncoder().encode(data)
        set(encoded,  forKey: defaultName)
    }
    func userDefaultObject<T: Codable>(dataType: T.Type, key: String) -> T? {
        guard let userDefaultData = data(forKey: key) else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: userDefaultData)
    }
}
