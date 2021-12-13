//
//  ProductHelper.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import Foundation

class ProductHelper {
    static let shared = ProductHelper()

    private init() {}

    func saveProductsList(_ products: [Product]) {
        products.forEach { product in
            self.saveProduct(product)
        }
    }

    func saveProduct(_ product: Product) {
        RealmService.shared.create(product)
    }

    func fetchProducts() -> [Product?] {
        let realm = RealmService.shared.realm
        let productsResult = realm.objects(Product.self)
        var products: [Product] = []

        productsResult.forEach { product in
            products.append(product)
        }

        return products
    }
}
