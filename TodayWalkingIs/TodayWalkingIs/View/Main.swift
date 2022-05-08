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
    @StateObject var coreLocationController: CoreLocationController = CoreLocationController()
    @State var showSecondView = false
    
//    @State var matchWLocation:WLocation
    
    @EnvironmentObject var wLocationController:WLocationController
    
    
    var body: some View {
        NavigationView{
            VStack(alignment:.center){
                HStack{
                    NavigationLink(destination: DairyContentView()) {
                        Image(systemName:"list.bullet.rectangle.portrait")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .padding()
                            .foregroundColor(Color("Thirdary"))
                        Spacer()
                    }
                }.padding(.top, 30)
                    Spacer()
                    Text("내가 있는곳에 일기를 적어보자..")
                        .font(.title)
                        .foregroundColor(Color("Thirdary"))
                    Map(coordinateRegion: $coreLocationController.region, showsUserLocation: true, annotationItems: wLocationController.wLocations) {
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
                    NavigationLink(destination:PlaceWrite()) {
                    ZStack {Circle()
                            .frame(width: 64.0,height: 64.0)
                                .foregroundColor(Color("Secondary"))
                                Image(systemName: "square.and.pencil").foregroundColor(Color("Thirdary"))
                        
                    }
                }.padding()
                                   }
//                    NavigationLink(destination: PlaceWrite()) {
//                            Image(systemName: "square.and.pencil")
//                                .foregroundColor(Color.white)
//                                .font(.system(size: 24.0, weight: .regular))
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
