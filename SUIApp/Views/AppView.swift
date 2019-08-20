import Combine
import SwiftUI

struct AppView: View {
    
    init(store: Store<AppState, AppAction>) {
        self.store = store
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                if store.value.isLoggedIn {
                    HomeView(store: store).transition(.move(edge: .trailing))
                } else {
                    LogInView(store: store).transition(.move(edge: .leading))
                }
            }
            if store.value.isLoading {
                ActivityIndicator()
            }
        }.alert(isPresented: Binding<Bool>(get: {
            self.store.value.showsAlert
        }, set: { show in
            if !show { self.store.send(.dismissAlert) }
        })) {
            Alert(title: Text(store.value.alertMessage ?? ""))
        }
    }
    
    // MARK: Dependencies
    
    @ObservedObject private var store: Store<AppState, AppAction>
    
    // MARK: Internal state
    
    @State private var username: String = ""
    @State private var password: String = ""
    
}
