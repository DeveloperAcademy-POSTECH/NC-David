//
//  HomeView.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/11/23.
//

import Foundation
import SwiftUI
import MapKit
struct HomeView: View {
    @ObservedObject var coreLocation:CoreLocation = CoreLocation()
    @EnvironmentObject var locationData: LocationData
    var body: some View {
        NavigationView {
            VStack{
                Map(coordinateRegion: $coreLocation.region, showsUserLocation: true)
                Text("Title")
                Text("SubTitle")
            }
            .onAppear {
                coreLocation.checkLocation()
            }
            .toolbar {
                ToolbarItemGroup(placement:.navigationBarLeading) {
                    NavigationLink(destination: Sample().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "list.bullet.clipboard")
                            .resizable()
                            .frame(width:36, height: 36)
                        Spacer()
                    }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    NavigationLink(destination: WriteView().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "list.bullet.clipboard")
                                .resizable()
                                .frame(width:48, height: 48)
                        }
                }
            }
        }
    }
}


//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
