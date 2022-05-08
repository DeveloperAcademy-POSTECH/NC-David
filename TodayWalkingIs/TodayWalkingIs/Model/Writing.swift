
import Foundation
import SwiftUI
struct Writing: Identifiable{
    let id: UUID
    let date:String
    let name:String
    let description:String
    let locationId:Int
    
    static let example = Writing(id: UUID(), date: "2022-05-03- 17시 36분", name: "키워드1, 키워드2, 키워드3", description: "오늘도 세션이 빡쎗다", locationId: -2)
}


// delegation Pattern

//protocol WritingTool {
//    func save()
//    func reset()
//    func delete()
//    func send()
//}
//
//
//class WritingDelegate {
//    var delegate: WritingTool?
//
//}
//
//struct Dairy: WritingTool {
//    init(delegate:WritingDelegate) {
//        delegate.delegate = self
//    }
//
//    func save() {
//
//    }
//
//    func reset() {
//
//    }
//
//    func delete() {
//    }
//
//    func send() {
//
//    }
//}
//
//
//
//
