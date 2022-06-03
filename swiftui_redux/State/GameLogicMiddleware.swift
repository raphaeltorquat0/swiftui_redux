import Combine
import Foundation

let gameLogic: MiddleWare<ThreeDucksState, ThreeDucksAction> = { state, action in
    switch action {
    case .startGame:
        var gameAnimals: [Animal] = [.ducks]
        let allAnimals: [Animal] = [.bat, .bear, .elephant, .horse, .monkey, .owl, .pelican, .rabbit, .turtle].shuffled()
    case .flipCard:
        let flippedCards = state.cards.filter { $0.isFlipped }
        
        if flippedCards.count == state.cards.count {
            return Just(.winGame).delay(for: 1, scheduler: DispatchQueue.main).eraseToAnyPublisher()
        }
        let selectedCards = state.selectedCards
        if selectedCards.count == 2 {
            if selectedCards[0].animal == selectedCards[1].animal {
                return Just(.clearSelectedCards)
                    .eraseToAnyPublisher()
            } else {
                return Just(.unFlipSelectedCards)
                    .delay(for: 1, scheduler: DispatchQueue.main).eraseToAnyPublisher()
            }
        }
        default:
        break
    }
 return Empty().eraseToAnyPublisher()
}
