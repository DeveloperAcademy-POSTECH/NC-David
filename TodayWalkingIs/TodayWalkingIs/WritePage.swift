//
//  PlaceMemory.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/05/02.
//

import Foundation
import SwiftUI

struct WritePage: View {
    @Environment(\.presentationMode) var presentationMode
    //    @EnvironmentObject var locationData: LocationData
    
    @State private var name:String = ""
    @State private var description:String = ""
    @State private var isPresented = false
    @State private var sourceType = UIImagePickerController.SourceType.photoLibrary
    @State private var image:UIImage?
    
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    ZStack {
                        if let image = self.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .edgesIgnoringSafeArea(.leading)
                                .edgesIgnoringSafeArea(.trailing)
                                .edgesIgnoringSafeArea(.bottom)
                        }
                        else {
                            Image(uiImage: UIImage())
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .edgesIgnoringSafeArea(.leading)
                                .edgesIgnoringSafeArea(.trailing)
                                .edgesIgnoringSafeArea(.bottom)
                            VStack {
                                Section {
                                    VStack {
                                        Image(systemName: "photo")
                                            Button {
                                                self.isPresented.toggle()
                                            } label: {
                                                Image(systemName: "plus")
                                            }.sheet(isPresented: $isPresented,onDismiss: {
                                                
                                            },content: {
                                                ImagePicker(sourceType: self.sourceType, image: $image)
                                            })

                                        Text("사진을 추가해주세요")
                                    }
                                }
                            }
                        }
                    }
                }
                VStack {
                    HStack(spacing:10){
                        Text("제목")
                            .padding()
                        Spacer()
                        TextField(text: $name, prompt: Text("제목을 입력해주세요")){
                        }
                    }
                    Divider()
                ZStack(alignment: .leading) {
                    if description.isEmpty || description == "" {
                        Text("본문을 입력해주세요")
                    }
                    TextEditor(text: $description)
                }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement:.navigationBarLeading){
                    NavigationLink(destination: HomePage().navigationBarBackButtonHidden(true)) {
                        Text("홈으로")
                        Spacer()
                    }
                }
                ToolbarItemGroup(placement:.navigationBarTrailing){
                    NavigationLink(destination: ListPage().navigationBarBackButtonHidden(true)) {
                        Text("작성완료")
                        Spacer()
                    }
                }
            }
        }
    }
}

struct WritePage_Previews: PreviewProvider {
    static var previews: some View {
        WritePage()
    }
}

