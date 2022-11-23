//
//  ContentView.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/04/27.
//

import SwiftUI
struct ContentView: View {
    @StateObject var locationData = LocationData()
    @AppStorage("WalkThrough") private var WalkThrough = false
    
    var body: some View {
        if WalkThrough {
            HomeView().environmentObject(locationData)
        } else {
            WalkThroughView().onDisappear{
                self.WalkThrough = true
            }
        }
    }
}

