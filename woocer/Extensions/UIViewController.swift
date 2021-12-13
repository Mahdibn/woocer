//
//  UIViewController.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import Foundation
import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        let viewControllerName = String(describing: self)
        let viewController = self.init(nibName: viewControllerName, bundle: nil)
        return viewController
    }
}
