//
//  ContentView.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/04/27.
//

import SwiftUI
struct ContentView: View {
    @AppStorage("OnBoarding") private var OnBoardDing = 0
    
    init() {
        OnBoardDing += 1
    }
    
    var body: some View {
        if OnBoardDing >= 2 {
            HomePage()
        } else {
            OnboardingView()
        }
    }
}

