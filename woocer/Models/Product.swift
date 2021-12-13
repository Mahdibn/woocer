//
//  Product.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import RealmSwift

@objcMembers class Product: Object, Codable {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var price: String = ""
    var images = List<ImageObject>()

    convenience init(
        id: Int,
        name: String,
        price: String,
        images: List<ImageObject>,
        imageUrl: String?
    ) {
        self.init()
        self.id = id
        self.name = name
        self.price = price
        self.images = images
    }
}
