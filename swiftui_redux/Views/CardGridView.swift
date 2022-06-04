import SwiftUI

struct CardGridView: View {
  @EnvironmentObject var store: ThreeDucksStore
  var cards: [Card]
  private let columns = [
    GridItem(.fixed(100)),
    GridItem(.fixed(100)),
    GridItem(.fixed(100))
  ]
  var body: some View {
    LazyVGrid(columns: columns, alignment: .center, spacing: 4, pinnedViews: []) {
      ForEach(cards) { card in
        CardView(card: card)
          .frame(width: nil, height: 80)
          .onTapGesture {
            store.dispatch(.flipCard(card.id))
          }
      }
    }
    .animation(.default)
  }
}

struct CardGridView_Previews: PreviewProvider {
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

    CardGridView(cards: previewStore.state.cards)
      .environmentObject(previewStore)
  }
}

