//
//  WalkThrough.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/04/27.
//

import Foundation
import SwiftUI
import UIKit

struct WalkThroughView: View {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())]
    let images:[Image] = [
    Image("image0"),
    Image("image1"),
    Image("image2"),
    Image("image0"),]
    @StateObject var locationData = LocationData()
    var body: some View {
        NavigationView{
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(0...images.count-1, id: \.self) { index in
                        NavigationLink(destination: Sample().navigationBarBackButtonHidden(true)) {
                            images[index]
                                .resizable()
                                .frame(width: 200, height: 200)
                        }.navigationBarBackButtonHidden(true)
                    }
                }
                HStack{
                    Text("플레이어리").font(.largeTitle)
                    Spacer()
                }
                Text("장문의글귀").font(.body)
                Spacer()
                HStack{
                    Spacer()
                    NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                            .resizable()
                            .frame(width: 48,height: 48)
                            .padding()
                    }
                }
            }
            .hiddenNavigationBarStyle()
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
        WalkThroughView()
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}


