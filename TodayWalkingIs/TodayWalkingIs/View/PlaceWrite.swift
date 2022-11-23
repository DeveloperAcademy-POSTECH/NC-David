//
//  PlaceMemory.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/05/02.
//

import Foundation
import SwiftUI

struct PlaceWrite: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var locationController:LocationData
    @EnvironmentObject private var coreLocationController:CoreLocation
    
    var nowTime:String {
        let nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        // 2020-08-13 16:3
        return dateFormatter.string(from: nowDate)
    }
    

    
    @State private var name:String = ""
    
    @State private var description:String = ""
    
    var body: some View {
        VStack{
            Text(
                "날짜 : " + nowTime ).foregroundColor(Color("Thirdary"))
            Form {
                TextField(text: $name, prompt: Text("해당장소 이름을 입력해주세요")) {
                    Text("Name")
                }
                .keyboardType(.default)
                .frame(width: 330, height: 100)
                
                TextEditor(text: $description).frame(width: 330, height: 500)
                    .foregroundColor(Color.gray)
                                .font(.custom("HelveticaNeue", size: 15))
                                .lineSpacing(5)
            }.background(Color("Secondary"))
//            Text("\(locationObject.latitude)\(locationObject.longitude)")  작성누르면 latitude와 longitude 값은 넘어온다
            NavigationLink(destination: Main(locationController: locationController)){
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    let wLocation = WLocation(id: UUID(), date: nowTime, name: name, description: description, latitude: coreLocationController.region.center.latitude, longitude: coreLocationController.region.center.longitude)
                    locationController.writeDiary(addWLocation: wLocation)
                }, label: {
                    Text("작성완료").foregroundColor(Color("Thirdary"))
                }).frame(width: 60, height: 60)
            }
            
        }.textFieldStyle(.roundedBorder)
            .background(Color("Primary"))
    }
}

