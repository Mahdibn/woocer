//
//  UITableView.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_ type: T.Type) where T: ReusableView {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
}
