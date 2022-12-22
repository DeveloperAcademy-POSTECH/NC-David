//
//  OnboardingWrite.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/12/09.
//

import Foundation
import SwiftUI

struct OnBoardingWrite: View {
    
    var writeTime:String {
        let nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.string(from: nowDate)
    }
    @State private var title:String = ""
    @State private var description:String = ""
    @State private var isPresented = false
    @State private var sourceType = UIImagePickerController.SourceType.photoLibrary
    @State private var image:UIImage?
    
    var body: some View {
        NavigationView {
            VStack{
                Text("첫 글쓰기를 플레이어리에서 작성하려고합니다 지금 드는 생각을 글로 작성해주세요" + "\n" + "사진도 추가 할수있습니다")
                    .font(.custom("SongMyung-Regular.ttf", size: 18))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(Color("Font"))
                    .padding()
                if let image = self.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 250)
                }
                else {
                    VStack {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(maxWidth: 48, maxHeight: 48)
                            .foregroundColor(Color("Icon"))
                        Button {
                            self.isPresented.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(maxWidth: 48, maxHeight: 48)
                                .foregroundColor(Color("Icon"))
                        }.sheet(isPresented: $isPresented,onDismiss: {
                        },content: {
                            ImagePicker(sourceType: self.sourceType, image: $image)
                        })
                        Text("사진을 추가해주세요")
                            .font(.custom("BlackHanSans-Regular.ttf", size: 28))
                    }
                }
                HStack(spacing:10){
                        Text("제목")
                            .padding()
                        Spacer()
                    TextField("제목을 입력해주세요", text: $title)
                    }
                    Divider()
                    ZStack(alignment: .leading) {
                        if description.isEmpty || description == "" {
                            Text("본문을 입력해주세요")
                        }
                        TextEditor(text: $description)
                    }
            }
            .toolbar {
                ToolbarItemGroup(placement:.bottomBar){
                    Spacer()
                    NavigationLink(destination: OnboardingList().navigationBarBackButtonHidden(true)) {
                        Text("작성완료")
                            .font(.custom("BlackHanSans-Regular.ttf", size: 24))
                            .foregroundColor(Color("Button"))
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

