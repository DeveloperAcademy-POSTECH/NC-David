//
//  OnboardingList.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/12/09.
//

import Foundation
import SwiftUI

struct OnboardingList: View {
    var body: some View {
        NavigationView {
            VStack {
                List(Write.writedatas) { write in
                    NavigationLink(destination: ListDetailPage(write: write)) {
                        Text(write.title)
                    }
                }
                Text("훌륭하게 글쓰기를 완료해주셨군요 이제부터 당신은 작가입니다 앞으로 계속 현재있는장소에 글쓰기를 하고싶다면 플레이어리를 이용해서 글쓰기를 해주세요")
                Text("명언")
                Text("명언저자")
            }.toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    NavigationLink(destination: HomePage().navigationBarBackButtonHidden(true)) {
                            Text("시작하기")
                        }
                }
                }
        }
    }
}

struct OnboardingList_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingList()
    }
}
