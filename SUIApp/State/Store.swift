import Combine

final class Store<Value, Action>: ObservableObject {

    init(initialValue: Value, reducer: @escaping (inout Value, Action) -> Void) {
        self.reducer = reducer
        self.value = initialValue
    }

    @Published private(set) var value: Value

    func send(_ action: Action) {
        self.reducer(&self.value, action)
    }

    // MARK: Internals

    private let reducer: (inout Value, Action) -> Void

}
