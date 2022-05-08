
import SwiftUI

@main
struct TodayWalkingIsApp: App {
    var locationAndWritingController = WLocationController()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(locationAndWritingController)
        }
    }
}
