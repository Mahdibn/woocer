//
//  ProductListCoordinator.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import UIKit

extension MainCoordinator {
    func gotoProductList(user: User) {
        ProductsContainer().setupContainer(coordinator: self, user: user)
    }
}
