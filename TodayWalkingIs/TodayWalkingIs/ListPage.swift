
import SwiftUI
import Foundation


struct ListPage: View {
    
    
    var dateString:String {
        let nowDate = Write.writedatas[0].date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.string(from: nowDate)
    }
    
    
    var body: some View {
        NavigationView {
            VStack{
                Form{
                    Section (header:Text("일기장리스트")){
                        List(Write.writedatas) { write in
                            NavigationLink(destination: ListDetailPage(write: write).navigationBarBackButtonHidden(true)){
                                HStack {
                                    Image(systemName: "text.book.closed")
                                    Text(write.title)
                                    Spacer()
                                    Text(dateString)
                                }
                            }
                        }
                    }
                }
                Text("명언")
                Text("명언저자")
            }
            .toolbar {
                ToolbarItemGroup(placement:.bottomBar) {
                    Spacer()
                    NavigationLink(destination: HomePage().navigationBarBackButtonHidden(true)) {
                        Text("홈으로")
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
