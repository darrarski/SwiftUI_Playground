func appReducer(state: inout AppState, action: AppAction) {
    switch action {
    case .blockUI:
        state.isLoading = true
    case .unblockUI:
        state.isLoading = false
    case .logIn(let user):
        state.user = user
    case .logOut:
        state.user = nil
    case .showAlert(let message):
        state.alert = message
    case .dismissAlert:
        state.alert = nil
    }
}
