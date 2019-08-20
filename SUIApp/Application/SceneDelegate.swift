import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: UIWindowSceneDelegate

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let store = Store(initialValue: AppState(), reducer: appReducer)
        let appView = AppView(store: store)
        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            self.window?.rootViewController = UIHostingController(rootView: appView)
            self.window?.makeKeyAndVisible()
        }
    }

}
