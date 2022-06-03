import Combine

typealias MiddleWare<State, Action> = (State, Action) -> AnyPublisher<Action, Never>

