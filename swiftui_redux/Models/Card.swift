import Foundation

struct Card: Identifiable {
    let id: UUID
    let animal: Animal
    let isFlipped: Bool
    
    init(id: UUID = UUID(), animal: Animal, isFlipped: Bool = false) {
        self.id = id
        self.animal = animal
        self.isFlipped = isFlipped
    }
}
