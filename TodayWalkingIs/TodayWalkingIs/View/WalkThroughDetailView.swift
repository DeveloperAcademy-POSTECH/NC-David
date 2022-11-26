//
//  WalkThroughDetailView.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/11/24.
//

import SwiftUI

struct WalkThroughDetailView: View {
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                Text("Hello I am Detail")
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
        }

    }
}

struct WalkThroughDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WalkThroughDetailView()
    }
}
