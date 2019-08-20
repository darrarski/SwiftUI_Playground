import Combine
import SwiftUI

struct LogInView: View {

    init(store: Store<AppState, AppAction>) {
        self.store = store
        self.service = LogInService(store: store)
    }

    var body: some View {
        Form {
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            Button(action: {
                UIWindow.endEditing(force: true)
                self.service.logIn(username: self.username, password: self.password)
            }) {
                Text("Log In")
            }
        }.navigationBarTitle("Log In")
    }

    // MARK: Dependencies

    @ObservedObject private var store: Store<AppState, AppAction>
    private let service: LogInService

    // MARK: Internal state

    @State private var username: String = ""
    @State private var password: String = ""

}
