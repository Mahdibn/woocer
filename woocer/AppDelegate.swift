//
//  AppDelegate.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setKeyboardApearence()
        configCoordinator()
        return true
    }

    fileprivate func setKeyboardApearence(){
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 30
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Done"
    }

    fileprivate func configCoordinator() {
        let navigationController = BaseNavigationController()
        coordinator = MainCoordinator(navigationController: navigationController)
        coordinator?.gotoSignIn()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator?.navigationController
        window?.makeKeyAndVisible()
    }
}

