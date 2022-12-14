//
//  WalkThrough.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/04/27.
//

//TODO: 1. 뷰 구성 -> 2. 폰트 Color 더미데이터 넣기 -> CoreData 구현 -> 디자인패턴고려 -> 앱사용 -> TDD 도입위해서 UITEST 진행 -> PerformanceTest학습

import Foundation
import SwiftUI
import UIKit

struct OnboardingView: View {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())]
    let images:[Image] = [
    Image("image0"),
    Image("image1"),
    Image("image2"),
    Image("image0")]
    
    var body: some View {
        NavigationView{
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(0...images.count-1, id: \.self) { index in
                        NavigationLink(destination: OnboardingMain().navigationBarBackButtonHidden(true)) {
                            images[index]
                                .resizable()
                                .frame(width: 200, height: 200)
                        }.navigationBarBackButtonHidden(true)
                    }
                }
                Text("이미지를 클릭해보세요")
                Text("슬로건")
                VStack{
                    Text("소개테스트1")
                    Text("소개테스트2")
                    Text("소개테스트3")
                    
                }
                Text("명언").font(.body)
                Text("명언작가")
                Spacer()
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    NavigationLink(destination: OnBoardingWrite().navigationBarBackButtonHidden(true)) {
                            Text("다음")
                        }
                }
                }
            }
        }
}

struct WalkThroughView_Previews: PreviewProvider {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())]
    let images:[Image] = [
    Image("image0"),
    Image("image1"),
    Image("image2"),
    Image("Image0"),]


    static var previews: some View {
        OnboardingView()
    }
}

// MARK: View Modifier 예시
//struct HiddenNavigationBar: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//        .navigationBarTitle("", displayMode: .inline)
//        .navigationBarHidden(true)
//    }
//}
//
//extension View {
//    func hiddenNavigationBarStyle() -> some View {
//        modifier( HiddenNavigationBar() )
//    }
//}


