//
//  WalkThrough.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/04/27.
//

import Foundation
import SwiftUI
import UIKit

struct IndicatorToMain: View {
    @StateObject var locationController = LocationController()
    @State private var showMain:Bool = false
    var body: some View {
        if showMain {
            Main(locationController: locationController)
        }
        else {
            IndicatorView(showMain: $showMain)
        }
    }
}

//struct IndicatorView_Previews: PreviewProvider {
//    @Binding var showMain:Bool?
//
//    static var previews: some View {
//        IndicatorView(showMain: nil)
//    }
//}


struct OnboardingView: View {
    let page:String
    let headline:Text
    let subline:Text

    
    @Binding var showMain:Bool
    
    func moveToMain() {
        showMain.toggle()
    }
    
    var body: some View {
        VStack{
            Spacer()
            HStack(alignment: .center){
                headline
            }
            Spacer()
            Image(page)
                .resizable()
                .frame(width: Double.infinity, height: 350)
            if subline == Text("") {
                Spacer()
                ZStack{
                    Rectangle()
                        .frame(width: 120, height: 50)
                        .foregroundColor(Color("Secondary"))
                        .cornerRadius(20.0)
                    Button(action: moveToMain) {
                        Label("메인으로가기",systemImage: "forward.fill").foregroundColor(Color("Thirdary"))
                    }
                }
                Spacer()
            } else {
                Spacer()
                HStack(alignment: .center){
                    subline
            }
            Spacer()
        }
        }
        .cornerRadius(5)
        .background(Color("Secondary"))
}
}
    
struct IndicatorView: View {
    @Binding var showMain:Bool
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
        
        let pages:[String] = ["Image", "Image2", "Image3"]
    let headlines:[Text] = [Text("우리의 하루는 여행입니다 누군가를 만나러 특정장소로 이동하고 그 여정이 끝나면 다시 집으로 돌아옵니다.").foregroundColor(Color("Thirdary")),
                            Text("또는 그 장소에대한 생각을 어딘가에 적고싶은 충동도 느낄수있을것입니다.").foregroundColor(Color("Thirdary")), Text("그래서 이제부터 우리는  우리의 장소를 기억을할수있게  현재 위치에 대한 일기를 작성을 시작해보도록하겠습니다...").foregroundColor(Color("Thirdary"))]
        let sublines:[Text] = [Text("만약에 그러한 여정에 대한 감정,생각,기억들을 불러올수있으면 어떨까요? ").foregroundColor(Color("Thirdary")),Text("그러한 감정,생각,기억은 우리가 미쳐 저장하지못한 소중한데이터 일수있습니다.").foregroundColor(Color("Thirdary")), Text("")]
        
        var arrayForLoop : [(String,Text,Text)] {
            let result = zip(pages,zip(headlines,sublines))
            return result.map {
                ($0.0, $0.1.0, $0.1.1)
            }
        }
        
        var body: some View {
            
            TabView {
                ForEach(arrayForLoop, id:\.0) { item in
                    OnboardingView(page: item.0, headline: item.1, subline: item.2,showMain: $showMain)
                        .cornerRadius(20)
                }
            }
            .padding(.all, 0)
            .background(Color("Primary"))
            .tabViewStyle(PageTabViewStyle())
            .onAppear {
            setupAppearance()
        }
    }
}


