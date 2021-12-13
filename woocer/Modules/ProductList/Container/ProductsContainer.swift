//
//  ProductsContainer.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import Foundation
import Swinject

class ProductsContainer {
    private let container = ContainerHelper.container

    func setupContainer(coordinator: MainCoordinator, user: User) {
        Route.URL.baseUrl = user.website

        container.register(User.self) { resolver -> User in
            return user
        }

        container.register(ProductListViewModel.self) { _ in
            return ProductListViewModel(consumerKey: user.key, consumerSecret: user.secret)
        }

        container.register(ProductListViewController.self) { r in
            let controller = ProductListViewController.instantiate()
            controller.coordinator = coordinator
            controller.user = r.resolve(User.self)
            controller.viewModel = r.resolve(ProductListViewModel.self)
            return controller
        }

        UIApplication.shared.windows.first?.rootViewController = container.resolve(ProductListViewController.self)
    }
}
