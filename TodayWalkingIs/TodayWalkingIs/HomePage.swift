//
//  HomeView.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/11/23.
//

import Foundation
import SwiftUI
import MapKit
struct HomePage: View {
    @ObservedObject var coreLocation:CoreLocation = CoreLocation()
    var body: some View {
        NavigationView {
            VStack{
                Map(coordinateRegion: $coreLocation.region, showsUserLocation: true)
                Text("명언")
                Text("명언저자")
            }
            .onAppear {
                coreLocation.checkLocation()
            }
            .toolbar {
                ToolbarItemGroup(placement:.navigationBarLeading) {
                    NavigationLink(destination: ListPage().navigationBarBackButtonHidden(true)) {
                        Text("일기장")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Spacer()
                    NavigationLink(destination: SettingPage().navigationBarBackButtonHidden(true)) {
                            Text("설정")
                    }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    NavigationLink(destination: WritePage().navigationBarBackButtonHidden(true)) {
                            Text("글쓰기")
                    }
                }
            }
        }
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
