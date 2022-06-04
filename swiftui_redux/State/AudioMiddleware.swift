import Foundation
import Combine
import AVKit
import os.log

func audioPlayerMiddleware(using player: QuackPlayer) -> MiddleWare<ThreeDucksState, ThreeDucksAction> {
    { state, action in
        switch action {
        case .flipCard(let id):
            let card = state.selectedCards.first {$0.id == id}
            guard card?.animal == .ducks else {
                break
            }
            player.play()
        default:
            break
        }
        return Empty().eraseToAnyPublisher()
    }
}
