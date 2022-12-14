//
//  SettingPage.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/12/14.
//

import Foundation
import SwiftUI

enum FontStyle: String, CaseIterable, Identifiable {
    case basic, elite, cute
    var id: Self { self }
}

enum ThemeStyle: String, CaseIterable, Identifiable {
    case basic, elite, cute
    var id: Self { self }
}





struct SettingPage: View {
    @State private var selectedFont: FontStyle = .basic
    @State private var mapMagnitude: Double = 0.5
    @State private var darkMode:Bool = false
    @State private var selectedTheme: ThemeStyle = .basic
    
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    Section (header:Text("폰트변경")){
                        Picker("폰트", selection: $selectedFont) {
                                Text("기본").tag(FontStyle.basic)
                                Text("고급").tag(FontStyle.elite)
                                Text("귀여운").tag(FontStyle.cute)
                            }
                    }
                    Section (header: Text("지도크기변경")) {
                        Slider(value: $mapMagnitude)
                    }
                    Section (header: Text("배경색")) {
                        
                        Toggle(isOn: $darkMode) {
                            Text("어둡게")
                        }
                    }
                    Section (header:Text("테마변경")){
                        Picker("테마", selection: $selectedFont) {
                                Text("기본").tag(ThemeStyle.basic)
                                Text("고급").tag(ThemeStyle.elite)
                                Text("귀여운").tag(ThemeStyle.cute)
                            }
                    }
                }
                Text("개발자: 데이비드, 앱버전: 1.0.0")
            }.toolbar {
                ToolbarItemGroup(placement:.navigationBarLeading) {
                    NavigationLink(destination: OnBoardingWrite().navigationBarBackButtonHidden(true)) {
                        Text("홈으로")
                    }
                }
            }
        }
    }
}


struct SettingPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage()
    }
}
