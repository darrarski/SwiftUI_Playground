import SwiftUI

struct HomeView: View {
    
    init(store: Store<AppState, AppAction>) {
        self.store = store
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Welcome \(store.value.user?.username ?? "")")
            Divider()
            Button(action: {
                self.store.send(.logOut)
            }) {
                Text("Log Out")
            }
        }
        .navigationBarTitle("Home")
    }
    
    // MARK: Dependencies
    
    @ObservedObject private var store: Store<AppState, AppAction>
    
}
