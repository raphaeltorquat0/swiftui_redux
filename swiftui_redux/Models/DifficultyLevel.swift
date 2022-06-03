import SwiftUI

enum DifficultyLevel: String, Identifiable, CaseIterable, Comparable, Codable {
    case easy = "Easy"
    case normal = "Normal"
    case hard = "Hard"
    
    var color: Color {
        switch self {
        case .hard:
            return .red
        case .normal:
            return .blue
        case .easy:
            return .green
        }
    }
    
    var id: String {
        rawValue
    }
    
    static func < (lhs: DifficultyLevel, rhs: DifficultyLevel) -> Bool {
        switch(lhs, rhs) {
        case (.easy, .normal), (.easy, .hard), (.normal, .hard):
            return true
        default:
            return false
        }
    }
}
