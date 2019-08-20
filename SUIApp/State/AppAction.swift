enum AppAction {
    case blockUI
    case unblockUI
    case logIn(AppUser)
    case logOut
    case showAlert(String)
    case dismissAlert
}
