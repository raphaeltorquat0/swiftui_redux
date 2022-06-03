import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: ThreeDucksStore
    var body: some View {
        switch store.state.gameState {
        case .title:
            TitleScreenView()
        case .started:
            GameScreenView()
        case .won:
            GameWinScreenView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ThreeDucksStore(initial: ThreeDucksState(), reducer: threeDucksReducer))
    }
}
