//
//  Example.swift
//  TodayWalkingIs
//
//  Created by David on 2022/12/20.
//

import Foundation
import SwiftUI

class Example {
    private let images:[Image] = [
    Image("image0"),
    Image("image1"),
    Image("image2"),
    Image("image3")]
    private let titles:[String] = [
        "아메리칸 국도투어",
        "아메리칸 국도투어",
        "아메리칸 국도투어",
        "아메리칸 국도투어"
    ]
    private let descriptions:[String] = [
        "무작정 떠난 국도투어 설레는 마음에 시작을 알리는 사진을 한반 찍어본다. 지금의 느김을 언젠가 다시 느끼기위해 이렇게 글을 작성한다 이곳의 날씨와 모습들은 생생히 묘사 가능하다 전날까지 비가왔지만 비온뒤 맑음이 되듯이 하늘이 뻥뚫려있고 그로인해서 상쾌한공기가 맑게 들이마셔진다. 도로의 냄새는 풀냄새가 조금나고 매우 커다란 절벅과 바위에서 느껴지는 무색무취의 강렬한 향이 존재하는거같다 배낭한개와 국도를 투어하는 자동차하나만 있으면 못 갈곳도 없다 지금 느끼는 자유야 말로 해방감에 제일 가까운것같다..",
        "무작정 떠난 국도투어 설레는 마음에 시작을 알리는 사진을 한반 찍어본다. 지금의 느김을 언젠가 다시 느끼기위해 이렇게 글을 작성한다 이곳의 날씨와 모습들은 생생히 묘사 가능하다 전날까지 비가왔지만 비온뒤 맑음이 되듯이 하늘이 뻥뚫려있고 그로인해서 상쾌한공기가 맑게 들이마셔진다. 도로의 냄새는 풀냄새가 조금나고 매우 커다란 절벅과 바위에서 느껴지는 무색무취의 강렬한 향이 존재하는거같다 배낭한개와 국도를 투어하는 자동차하나만 있으면 못 갈곳도 없다 지금 느끼는 자유야 말로 해방감에 제일 가까운것같다..",
        "무작정 떠난 국도투어 설레는 마음에 시작을 알리는 사진을 한반 찍어본다. 지금의 느김을 언젠가 다시 느끼기위해 이렇게 글을 작성한다 이곳의 날씨와 모습들은 생생히 묘사 가능하다 전날까지 비가왔지만 비온뒤 맑음이 되듯이 하늘이 뻥뚫려있고 그로인해서 상쾌한공기가 맑게 들이마셔진다. 도로의 냄새는 풀냄새가 조금나고 매우 커다란 절벅과 바위에서 느껴지는 무색무취의 강렬한 향이 존재하는거같다 배낭한개와 국도를 투어하는 자동차하나만 있으면 못 갈곳도 없다 지금 느끼는 자유야 말로 해방감에 제일 가까운것같다..",
        "무작정 떠난 국도투어 설레는 마음에 시작을 알리는 사진을 한반 찍어본다. 지금의 느김을 언젠가 다시 느끼기위해 이렇게 글을 작성한다 이곳의 날씨와 모습들은 생생히 묘사 가능하다 전날까지 비가왔지만 비온뒤 맑음이 되듯이 하늘이 뻥뚫려있고 그로인해서 상쾌한공기가 맑게 들이마셔진다. 도로의 냄새는 풀냄새가 조금나고 매우 커다란 절벅과 바위에서 느껴지는 무색무취의 강렬한 향이 존재하는거같다 배낭한개와 국도를 투어하는 자동차하나만 있으면 못 갈곳도 없다 지금 느끼는 자유야 말로 해방감에 제일 가까운것같다.."
    ]
    
    func getImage(number:Int) -> Image {
        self.images[number]
    }
    func getTitle(number:Int) -> String {
        self.titles[number]
    }
    func getDescription(number:Int) -> String {
        self.descriptions[number]
    }

}
