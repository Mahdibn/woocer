//
//  URL.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import Foundation

enum Route: String {
    case baseUrl
    case products = "/wp-json/wc/v3/products"
}

extension Route {
    struct URL {
        static var baseUrl = ""
    }
}

extension Route {
    func url() -> String {
        switch self {
        case .products:
            return Route.products.rawValue
        default:
            return Route.URL.baseUrl
        }
    }
}
