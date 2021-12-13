//
//  BaseNavigation.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isHidden = true
        setupNavigationBar()
    }

    fileprivate func setupNavigationBar() {
        self.navigationBar.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 17, weight: .regular)
        ]
        self.navigationBar.tintColor = .white
        self.navigationBar.barTintColor = .white
        self.navigationBar.isTranslucent = false
    }
}
