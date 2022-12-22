//
//  WalkThrough.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/04/27.
//

//MARK: 폰트 Color 더미데이터 넣기 -> CoreData 구현 -> 디자인패턴고려 -> 앱사용 -> TDD 도입위해서 UITEST 진행 -> PerformanceTest학습

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
    Image("image3")]
    
    let quote:Quote = Quote()
    
    @State private var animate = false
    @State private var quoteTitle = ""
    @State private var quoteSubTitle = ""
    
    
    var body: some View {
        NavigationView{
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(0...images.count-1, id: \.self) { index in
                        NavigationLink(destination: OnboardingExample(number: index).navigationBarBackButtonHidden(true)) {
                            images[index]
                                .resizable()
                                .frame(width: 200, height: 200)
                        }.navigationBarBackButtonHidden(true)
                    }
                }.clipped()
                Text("이미지를 클릭해보세요")
                    .font(.custom("SongMyung-Regular.ttf", size: 18))
                    .opacity(animate ? 0.0 : 0.5)
                    .animation(Animation.easeOut(duration: 2.0).repeatForever(), value: animate)
                    .onAppear {
                        self.animate = true
                    }
                Text("장소를 더 멋지게 기억해보자!")
                    .font(.custom("BlackHanSans-Regular.ttf", size: 30))
                    .foregroundColor(Color("Font"))

                VStack(alignment:.center){
                    Text("우리가 지나온 장소를 다시 기억하는 방식은 여러가지 입니다" + "\n" + "플레이어리는 지금 내위치에 대한 기억을 더 멋집게 남길수있는 앱입니다" + "\n" + "그 기억을 지도를 보고 시간이 흐른뒤에 다시한번 확인해보세요.")
                        .font(.custom("SongMyung-Regular.ttf", size: 18))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(Color("Font"))
                        .padding()
                }
                Text(quoteTitle)
                    .font(.custom("BlackHanSans-Regular.ttf", size: 24))
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                Text(quoteSubTitle).font(.custom("BlackHanSans-Regular.ttf", size: 18))
                Spacer()
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    NavigationLink(destination: OnBoardingWrite().navigationBarBackButtonHidden(true)) {
                            Text("다음")
                            .font(.custom("BlackHanSans-Regular.ttf", size: 24))
                            .foregroundColor(Color("Button"))
                        }
                }
            }
            .onAppear{
                self.quoteTitle = quote.getRandomShotQuote()[0]
                self.quoteSubTitle = quote.getRandomShotQuote()[1]
                
            }
            .background(Color("Background"))
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
    Image("Image3"),]


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


