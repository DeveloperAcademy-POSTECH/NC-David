//
//  ContentView.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/04/27.
//

import SwiftUI
struct ContentView: View {
    @StateObject private var locationDelegation = CoreLocationController()
    @AppStorage("tapCount") private var useCount = 0
    var useCountEnough:Bool = false
    mutating func userCountEnoughBool() {
        if useCount > 1000 {
            self.useCountEnough = true
        } else {
            self.useCountEnough = false
        }
    }
    init() {
            UINavigationBar.appearance().largeTitleTextAttributes =
        [.foregroundColor: UIColor(named: "Secondary") ?? .black]
            UINavigationBar.appearance().titleTextAttributes =
        [.foregroundColor: UIColor(named: "Secondary") ?? .black]
        useCount += 1
        userCountEnoughBool()
    }
    var body: some View {
        if useCountEnough {
            Main()
        } else {
            IndicatorToMain()
        }
    }
}

