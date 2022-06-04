import Foundation

enum ThreeDucksAction {
    case launch
    case startGame
    case endGame
    case winGame
    
    case setDifficulty(DifficultyLevel)
    case setupGame([Card])
    case setPreviousBestScore(Score)
    
    case flipCard(UUID)
    case clearSelectedCards
    case unFlipSelectedCards

}
