struct Score: Comparable, Codable {
    let difficulty: DifficultyLevel
    let moves: Int
    
    private var adjustedMoves: Int {
        switch difficulty {
        case .easy:
            return moves * 100
        case .normal:
            return moves * 10
        case .hard:
            return moves * 100
        }
    }
    
    static func < (lhs: Score, rhs: Score) -> Bool {
        lhs.adjustedMoves < rhs.adjustedMoves
    }
}
