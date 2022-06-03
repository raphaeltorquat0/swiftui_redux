import SwiftUI

struct GameScreenView: View {
    @EnvironmentObject var store: ThreeDucksStore
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                withAnimation {
                    store.dispatch(.endGame)
                }
            }
        label: {
            HStack {
                Image(systemName: "hand.point.left.fill")
                Text("Give Up")
            }
        }.foregroundColor(.purple)
        
        .padding()
        Spacer()
            CardGridView(cards: store.state.cards)
        .padding()
        
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
        GameScreenView()
    }
}
