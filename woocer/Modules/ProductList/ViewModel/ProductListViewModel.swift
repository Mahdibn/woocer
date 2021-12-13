//
//  ProductListViewModel.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import Moya
import RxSwift

class ProductListViewModel: BaseViewModel {
    let products = PublishSubject<[Product?]>()
    var consumerKey: String!
    var consumerSecret: String!

    init(consumerKey: String, consumerSecret: String) {
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret
    }

    private lazy var provider: MoyaProvider<Products> = {
        let endpointClosure = { (target: Products) -> Endpoint in
          let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)

          switch target {
          case .all:
              return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization": "Basic " + self.createCredentials(key: self.consumerKey, secret: self.consumerSecret)])
          }
        }
        return MoyaProvider(endpointClosure: endpointClosure)
    }()

    private func createCredentials(key: String, secret: String) -> String {
        let string = "\(key):\(secret)".data(using: .nonLossyASCII)!.base64EncodedString(options: [])
        return string
    }

    func fetchProducts() {
        let offlineProductList = ProductHelper.shared.fetchProducts()
        guard offlineProductList.isEmpty else {
            self.products.onNext(offlineProductList)
            return
        }

        provider.request(.all) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                do {
                    let products = try JSONDecoder().decode([Product].self, from: response.data)
                    ProductHelper.shared.saveProductsList(products)
                    self.fetchProducts()
                } catch {
                    self.products.onError(error)
                }
            case .failure(let error):
                self.products.onError(error)
            }
        }
    }
}
