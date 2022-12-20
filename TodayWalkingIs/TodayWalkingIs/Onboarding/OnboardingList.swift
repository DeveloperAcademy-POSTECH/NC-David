//
//  OnboardingList.swift
//  TodayWalkingIs
//
//  Created by David_ADA on 2022/12/09.
//

import Foundation
import SwiftUI

struct OnboardingList: View {
    let quote:Quote = Quote()
    @State var quoteTitle:String = ""
    @State var quoteSubTitle:String = ""
    var dateString:String {
        let nowDate = Write.writedatas[0].date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.string(from: nowDate)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("훌륭하게 글쓰기를 완료해주셨군요 이제부터 당신은 작가입니다 앞으로 계속 현재있는장소에 글쓰기를 하고싶다면 플레이어리를 이용해서 글쓰기를 해주세요")                    .font(.custom("SongMyung-Regular.ttf", size: 18))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(Color("Font"))
                    .padding()
                VStack{
                    Form{
                        Section (header:Text("일기장리스트")){
                            List(Write.writedatas) { write in
                                NavigationLink(destination: ListDetailPage(write: write).navigationBarBackButtonHidden(true)){
                                    HStack {
                                        Image(systemName: "text.book.closed")
                                            .resizable()
                                            .frame(maxWidth: 24, maxHeight: 18)
                                        Text(write.title)
                                            .font(.custom("BlackHanSans-Regular.ttf", size: 18))
                                        Spacer()
                                        Text(dateString)
                                            .font(.custom("BlackHanSans-Regular.ttf", size:18))
                                    }
                                }
                            }
                        }
                    }
                    Text(self.quoteTitle)
                        .font(.custom("BlackHanSans-Regular.ttf", size: 24))
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                    Text(self.quoteSubTitle)
                        .font(.custom("BlackHanSans-Regular.ttf", size: 18))
                }
                .onAppear {
                    self.quoteTitle = quote.getRandomLongQuote()[0]
                    self.quoteSubTitle = quote.getRandomLongQuote()[1]
                }
                .toolbar {
                    ToolbarItemGroup(placement:.bottomBar) {
                        Spacer()
                        NavigationLink(destination: HomePage().navigationBarBackButtonHidden(true)) {
                            Text("홈으로")                            .font(.custom("BlackHanSans-Regular.ttf", size: 24))
                                .foregroundColor(Color("Button"))
                        }
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
