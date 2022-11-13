
import SwiftUI

@main
struct TodayWalkingIsApp: App {
    var coreLocationController = CoreLocationController()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(coreLocationController)
        }
    }
}
