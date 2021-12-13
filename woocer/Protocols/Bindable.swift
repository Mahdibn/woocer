//
//  Bindable.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import Foundation

@objc protocol Bindable: AnyObject {
    @objc optional func bindUI()
    @objc optional func subscribe()
}
