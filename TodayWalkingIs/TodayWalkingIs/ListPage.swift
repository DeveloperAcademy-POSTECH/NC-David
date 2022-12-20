
import SwiftUI
import Foundation


struct ListPage: View {
    
    
    var dateString:String {
        let nowDate = Write.writedatas[0].date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.string(from: nowDate)
    }
    
    let quote:Quote = Quote()
    @State var quoteTitle:String = ""
    @State var quoteSubTitle:String = ""
    
    
    var body: some View {
        NavigationView {
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
                        Text("홈으로")
                            .font(.custom("BlackHanSans-Regular.ttf", size: 24))
                            .foregroundColor(Color("Button"))
                    }
                }
            }
        }
    }
}

struct ListPage_Previews: PreviewProvider {
    static var previews: some View {
        ListPage()
    }
}
