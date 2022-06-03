import Foundation

struct ThreeDucksState {
    
    var gameState: GameState = .title
    var gameDificculty: DifficultyLevel = .normal
    var cards: [Card] = []
    var selectedCards: [Card] = []
    var moves: Int = 0
    var previousBestScore: Score?
}
