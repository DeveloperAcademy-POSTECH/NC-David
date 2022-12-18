//
//  ListDetailPage.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/12/14.
//

import Foundation
import SwiftUI

struct ListDetailPage: View {
    
    // MARK: 작업진행중..
    let write:Write
    @State var title:String = ""
    @State var description:String = ""
    @State var image: UIImage = UIImage()
    @State var modifyBool:Bool = false
    
    func modify() {
        modifyBool = true
    }
    
    func changeImage() {
        
    }
    var body: some View {
        NavigationView{
            VStack {
                Image(uiImage: image).resizable()
                    .aspectRatio(contentMode: .fit)
                if modifyBool {
                    Button("이미지빈경") {
                        changeImage()
                    }
                }
                TextField("제목", text: $title).disabled(!modifyBool)
                TextEditor(text: $description).disabled(!modifyBool)
            }.toolbar {
                ToolbarItemGroup(placement:.navigationBarTrailing) {
                    Spacer()
                    if modifyBool {
                        NavigationLink(destination: ListPage().navigationBarBackButtonHidden(true)) {
                            Text("수정완료")
                        }
                    } else {
                        Button("수정하기") {
                            modify()
                        }
                    }
                }
                ToolbarItemGroup(placement:.bottomBar) {
                    Spacer()
                    NavigationLink(destination: HomePage().navigationBarBackButtonHidden(true)) {
                        Text("홈으로")
                    }
                }
            }
            .onAppear {
                self.title = write.title
                self.description = write.description
                self.image = write.image ?? UIImage(named: "image2")!
            }
        }
    }
}


struct ListDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailPage(write: Write.writedatas[0])
    }
}


