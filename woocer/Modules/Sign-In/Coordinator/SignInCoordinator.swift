//
//  SignInCoordinator.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import Foundation
import UIKit

extension MainCoordinator {
    func gotoSignIn() {
        let viewController = SignInViewController.instantiate()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
        UIApplication.shared.windows.first?.rootViewController = viewController
    }
}
