import Foundation

typealias Reducer<State, Action> = (State, Action) -> State

let threeDucksReducer: Reducer<ThreeDucksState, ThreeDucksAction> = {state, action in
    var mutatingState = state
    switch action {
    case .startGame:
        mutatingState.gameState = .started
        mutatingState.cards = [
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
            Card(animal: .elephant),
        ].shuffled()
    case .endGame:
        mutatingState.gameState = .title
    }
    return mutatingState
}
