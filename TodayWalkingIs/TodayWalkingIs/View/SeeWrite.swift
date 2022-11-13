import Foundation
let testData = LocationController()

import SwiftUI
import Foundation
struct DairyDetail: View {
    let wLocation:WLocation
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack {
                Section (header: Text("날짜 & 장소이름")
                    .foregroundColor(Color("Secondary"))
                    .font(.title)){
                    Spacer()
                    Label(wLocation.date, systemImage: "calendar").foregroundColor(Color("Secondary"))
                    HStack {
                        Label("장소 :", systemImage: "location.fill").foregroundColor(Color("Secondary"))
                        Text(wLocation.name).foregroundColor(Color("Secondary"))
                }
            }
                Spacer()
                Form{
                    Section (header: Text("일기장")
                        .foregroundColor(Color("Secondary"))
                        .font(.title2)){
                        TextEditor(text: .constant(wLocation.description)).font(.callout).foregroundColor(Color("Thirdary"))
            }
                }.background(Color("Sceondary"))
                Button(action: {self.presentationMode.wrappedValue.dismiss()}, label: {
                    Text("메인으로").foregroundColor(Color("Thirdary"))
                })
            }.background(Color("Primary"))
        }.navigationBarHidden(true)
    }
}


struct DairyContentView: View {
    
    @ObservedObject var locationController:LocationController
    
    var body: some View {
        NavigationView {
                VStack{
                    List(locationController.wLocations) { wLocation in
                        NavigationLink(destination: DairyDetail(wLocation: wLocation)){
                            Image(systemName: "text.book.closed")
                                .foregroundColor(Color("Secondary"))
                                .frame(width: 44, height: 44).scaleEffect(x: 1, y: -1, anchor: .center)
                            VStack(alignment: .leading) {
                                Text(wLocation.date)
                                Text(wLocation.name).foregroundColor(Color("Thirdary"))
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }.scaleEffect(x: 1, y: -1, anchor: .center)
                        }
                    }.background(Color("Secondary"))
                    .scaleEffect(x: 1, y: -1, anchor: .center)
                }
        }
        .navigationTitle("일기리스트")
        .padding()
        .background(Color("Primary"))
            }
    }


