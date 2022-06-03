import SwiftUI

struct GameScreenView: View {
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
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {}
        label: {
            HStack {
                Image(systemName: "hand.point.left.fill")
                Text("Give Up")
            }
        }.foregroundColor(.purple)
        
        .padding()
        Spacer()
        CardGridView(cards: cards)
        .padding()
        
        Spacer()
        Text("Moves: 0")
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
