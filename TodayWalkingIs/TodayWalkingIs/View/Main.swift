//
//  Main.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/04/27.
//

import Foundation
import SwiftUI
import MapKit


struct Main: View {
    @ObservedObject var locationController:LocationData
    @EnvironmentObject var coreLocationController:CoreLocation
    var body: some View {
        NavigationView{
            VStack(alignment:.center){
                HStack{
                    NavigationLink(destination: DairyContentView(locationController: locationController)) {
                        Image(systemName:"list.bullet.rectangle.portrait")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .padding()
                            .foregroundColor(Color("Thirdary"))
                        Spacer()
                    }
                }.padding(.top, 30)
                    Spacer()
                Text("영어 abcdfg 한글 가나다라..")
                    .font(Font.custom("NotoSerifKR-Bold", size: 20))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("Thirdary"))
                    Map(coordinateRegion: $coreLocationController.region, showsUserLocation: true, annotationItems: locationController.wLocations) {
                        wLocation in MapAnnotation(coordinate: wLocation.coordinate) {
                            NavigationLink(destination: DairyDetail(wLocation: wLocation)){
                                Circle()
                                    .stroke(.red, lineWidth: 3)
                                    .frame(width: 44, height: 44)
                                Text("\(wLocation.name)")
                            }
                            }
                        }
                    .cornerRadius(30)
                    .onAppear {
                        coreLocationController.checkIfLocationServiceIsEnabled()
                    }.frame(width: 350, height: 600)
                HStack{
                    Spacer()
                    NavigationLink(destination:PlaceWrite(locationController: locationController)) {
                    ZStack {Circle()
                            .frame(width: 64.0,height: 64.0)
                                .foregroundColor(Color("Secondary"))
                                Image(systemName: "square.and.pencil").foregroundColor(Color("Thirdary"))
                        
                    }
                }.padding()
                                   }
                Spacer()
            }.frame(
                minWidth:0,
                maxWidth: .infinity, minHeight: 0,
                maxHeight:.infinity)
            .background(Color("Primary"))
            .navigationTitle("Main")
            .navigationBarHidden(true)
    }
        }
}

