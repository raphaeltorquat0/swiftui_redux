import SwiftUI

@main
struct swiftui_reduxApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ThreeDucksStore(initial: ThreeDucksState(), reducer: threeDucksReducer))
        }
    }
}
