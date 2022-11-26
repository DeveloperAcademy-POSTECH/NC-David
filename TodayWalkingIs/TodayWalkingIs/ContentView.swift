//
//  ContentView.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/04/27.
//

import SwiftUI
struct ContentView: View {
    @StateObject var locationData = LocationData()
    @AppStorage("WalkThrough") private var WalkThrough = 0
    
    init() {
        WalkThrough += 1
    }
    
    var body: some View {
        if WalkThrough >= 2 {
            HomeView().environmentObject(locationData)
        } else {
            WalkThroughView()
        }
    }
}

