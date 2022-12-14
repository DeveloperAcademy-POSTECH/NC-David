//
//  OnboardingWrite.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/12/09.
//

import Foundation
import SwiftUI

struct OnBoardingWrite: View {
    @Environment(\.presentationMode) var presentationMode
    //    @EnvironmentObject var locationData: LocationData
    
    var writeTime:String {
        let nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.string(from: nowDate)
    }
    
    
    @State private var name:String = ""
    @State private var description:String = ""
    @State private var isPresented = false
    @State private var sourceType = UIImagePickerController.SourceType.photoLibrary
    @State private var image:UIImage?
    
    var body: some View {
        NavigationView {
            VStack{
                Text("첫 글쓰기를 플레이어리에서 작상하려고합니다 지금 드는 생각을 글로 작성해주세요 사진도 첨부하시면 더욱 좋습니다")
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
            }.toolbar {
                ToolbarItemGroup(placement:.bottomBar){
                    Spacer()
                    NavigationLink(destination: OnboardingList().navigationBarBackButtonHidden(true)) {
                        Text("작성완료")
                    }
                }
            }
        }
    }
}

struct OnBoardingWrite_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingWrite()
    }
}
