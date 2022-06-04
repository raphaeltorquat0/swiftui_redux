import Foundation

typealias Reducer<State, Action> = (State, Action) -> State

let threeDucksReducer: Reducer<ThreeDucksState, ThreeDucksAction> = {state, action in
    var mutatingState = state
    switch action {
    case .startGame:
        mutatingState.gameState = .started
        mutatingState.moves = 0
        mutatingState.selectedCards = []
    case .endGame:
        mutatingState.gameState = .title
    
    case .flipCard(let id):
        guard mutatingState.selectedCards.count < 2 else { break }
        guard !mutatingState.selectedCards.contains(where: { $0.id == id }) else { break }
        var cards = mutatingState.cards
        guard let selectedIndex = cards.firstIndex(where: { $0.id == id}) else { break }
        let selectedCard = cards[selectedIndex]
        let flippedCard = Card(id: selectedCard.id, animal: selectedCard.animal, isFlipped: true)
        cards[selectedIndex] = flippedCard
        mutatingState.selectedCards.append(selectedCard)
        mutatingState.cards = cards
        mutatingState.moves += 1
    case .clearSelectedCards:
        mutatingState.selectedCards = []
    case .winGame:
        mutatingState.gameState = .won
    case .unFlipSelectedCards:
        let selectedIDs = mutatingState.selectedCards.map{ $0.id }
        let cards: [Card] = mutatingState.cards.map { card in
            guard selectedIDs.contains(card.id) else { return card }
            return Card(id: card.id, animal: card.animal, isFlipped: false)
        }
        mutatingState.selectedCards = []
        mutatingState.cards = cards
    case .launch:
        mutatingState.gameState = .title
    case .setDifficulty(let difficulty):
        mutatingState.gameDificculty = difficulty
    case .setupGame(let cards):
        mutatingState.cards = cards
    case .setPreviousBestScore(let score):
        mutatingState.previousBestScore = score
    }
    return mutatingState
}
