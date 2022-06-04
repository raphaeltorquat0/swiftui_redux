import SwiftUI
import Combine

func bestScoreMiddleWare(using persistence: ScorePersistence) -> MiddleWare<ThreeDucksState, ThreeDucksAction> {
    { state, action in
        switch action {
        case .launch:
            if let score = persistence.load() {
                return Just(.setPreviousBestScore(score)).eraseToAnyPublisher()
            }
        case .winGame:
            let currentStore = Score(difficulty: state.gameDificculty, moves: state.moves)
            guard let previousStore = state.previousBestScore else {
                persistence.save(currentStore)
                return Just(.setPreviousBestScore(currentStore)).eraseToAnyPublisher()
            }
            if currentStore < previousStore {
                persistence.save(currentStore)
                return Just(.setPreviousBestScore(currentStore)).eraseToAnyPublisher()
            } else {
                break
            }
        default:
            break
    }
        return Empty().eraseToAnyPublisher()
  }
}
