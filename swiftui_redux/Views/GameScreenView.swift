import SwiftUI

struct GameScreenView: View {
    @EnvironmentObject var store: ThreeDucksStore
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                withAnimation {
                    store.dispatch(.endGame)
                }
            } label: {
            HStack {
                Image(systemName: "hand.point.left.fill")
                Text("Give Up")
            }
            .foregroundColor(.purple)
        }
        .padding()
        Spacer()
        CardGridView(cards: store.state.cards)
        .padding(8)
        
        Spacer()
            Text("Moves: \(store.state.moves)")
            .font(.subheadline)
            .foregroundColor(.purple)
            .padding()
        }
    }
}


struct GameScreenView_Previews: PreviewProvider {
    static var previews: some View {
        let previewStore: ThreeDucksStore = {
            let store = ThreeDucksStore.preview
            let cards = [
                Card(animal: .bat),
                Card(animal: .bat),
                Card(animal: .ducks),
                Card(animal: .ducks),
                Card(animal: .bear),
                Card(animal: .bear),
                Card(animal: .pelican),
                Card(animal: .pelican),
                Card(animal: .horse),
                Card(animal: .horse),
                Card(animal: .elephant),
                Card(animal: .elephant)
            ].shuffled()
            store.dispatch(.setupGame(cards))
            return store
        }()
        GameScreenView().environmentObject(previewStore)
    }
}
