//
//  OnboardingExample.swift
//  TodayWalkingIs
//
//  Created by David on 2022/12/20.
//

import Foundation
import SwiftUI


struct OnboardingExample: View {
    
    let example: Example = Example()
    let number:Int
    
    @State var title:String = ""
    @State var description:String = ""
    

    var body: some View {
        NavigationView{
            VStack {
                example.getImage(number: number).resizable()
                    .aspectRatio(contentMode: .fit)
                TextField("제목", text: $title)
                    .disabled(true)
                    .font(.custom("BlackHanSans-Regular.ttf", size: 30))
                    .foregroundColor(Color("Font"))
                    .padding()
                TextEditor(text: $description)
                    .disabled(true)
                    .font(.custom("SongMyung-Regular.ttf", size: 18))
                    .foregroundColor(Color("Font"))
                    .padding()
            }.toolbar {
                ToolbarItemGroup(placement:.navigationBarLeading) {
                    NavigationLink(destination: OnboardingView().navigationBarBackButtonHidden(true)) {
                        Text("돌아가기").font(.custom("BlackHanSans-Regular.ttf", size: 30))
                            .foregroundColor(Color("Button"))
                    }
                }
            }
            .onAppear {
                self.title = example.getTitle(number: number)
                self.description = example.getDescription(number: number)
            }
        }
    }
}


struct OnboardingExample_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingExample(number: 1)
    }
}

