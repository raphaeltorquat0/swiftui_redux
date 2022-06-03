import Foundation

class Store<State>: ObservableObject {
    typealias ThreeDucksStore = Store<ThreeDucksState>
    @Published private(set) var state: State
    
    init(initial: State) {
        self.state = initial
    }
}
