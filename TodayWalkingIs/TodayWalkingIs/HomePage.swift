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
    @State private var quoteTitle = ""
    @State private var quoteSubTitle = ""
    let quote:Quote = Quote()
    
    var body: some View {
        NavigationView {
            VStack{
                Map(coordinateRegion: $coreLocation.region, showsUserLocation: true)
                Text(quoteTitle)
                    .font(.custom("BlackHanSans-Regular.ttf", size: 24))
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                Text(quoteSubTitle)
                    .font(.custom("BlackHanSans-Regular.ttf", size: 18))
            }
            .onAppear {
                coreLocation.checkLocation()
                self.quoteTitle = quote.getRandomShotQuote()[0]
                self.quoteSubTitle = quote.getRandomShotQuote()[1]
            }
            .toolbar {
                ToolbarItemGroup(placement:.navigationBarLeading) {
                    NavigationLink(destination: ListPage().navigationBarBackButtonHidden(true)) {
                        Text("일기장")                            .font(.custom("BlackHanSans-Regular.ttf", size: 24))
                            .foregroundColor(Color("Button"))
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Spacer()
                    NavigationLink(destination: SettingPage().navigationBarBackButtonHidden(true)) {
                            Text("설정")
                            .font(.custom("BlackHanSans-Regular.ttf", size: 24))
                            .foregroundColor(Color("Button"))
                    }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    NavigationLink(destination: WritePage().navigationBarBackButtonHidden(true)) {
                            Text("글쓰기")
                            .font(.custom("BlackHanSans-Regular.ttf", size: 24))
                            .foregroundColor(Color("Button"))
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
