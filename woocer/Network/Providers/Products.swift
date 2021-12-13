//
//  Product.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import Foundation
import Moya

public enum Products {
    case all
}

extension Products: TargetType {
    public var baseURL: URL {
        return URL(string: Route.URL.baseUrl)!
    }

    public var path: String {
        switch self {
        case .all: return Route.products.url()
        }
    }

    public var method: Moya.Method {
        switch self {
        case .all: return .get
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        return .requestPlain
    }

    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    public var validationType: ValidationType {
        return .successCodes
    }
}
