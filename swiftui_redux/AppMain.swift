import SwiftUI

@main
struct swiftui_reduxApp: App {
    let store = ThreeDucksStore(
        initial: ThreeDucksState(),
        reducer: threeDucksReducer,
        middlewares: [
            gameLogic,
            bestScoreMiddleWare(using: ScorePersistence()),
            audioPlayerMiddleware(using: QuackPlayer())
        ])
    
    init() {
        store.dispatch(.launch)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
