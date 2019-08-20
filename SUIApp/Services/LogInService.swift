import Foundation
import SwiftUI

struct LogInService {

    init(store: Store<AppState, AppAction>) {
        self.store = store
    }

    func logIn(username: String, password: String) {
        store.send(.blockUI)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.store.send(.unblockUI)
            if password == "secret" {
                let user = AppUser(username: username)
                self.store.send(.logIn(user))
            } else {
                self.store.send(.showAlert("Invalid Password"))
            }
        }
    }

    // MARK: Internals

    private let store: Store<AppState, AppAction>

}
