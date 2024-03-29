//
//  Main.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/04/27.
//

import Foundation
import SwiftUI
import MapKit

struct OnboardingMain: View {
    @ObservedObject var coreLocation:CoreLocation = CoreLocation()
    var body: some View {
        NavigationView {
            VStack{
                Text("현재 당신의 위치기반으로 글쓰기를 작성하려고 합니다")                        .font(.custom("SongMyung-Regular.ttf", size: 18))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(Color("Font"))
                    .padding()
                Map(coordinateRegion: $coreLocation.region, showsUserLocation: true)
            }
            .onAppear {
                coreLocation.checkLocation()
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
        }
    }
}


struct OnboardingMain_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingMain()
    }
}
