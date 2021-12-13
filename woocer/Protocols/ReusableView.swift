//
//  ReusableView.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import Foundation
import UIKit

protocol ReusableView {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
