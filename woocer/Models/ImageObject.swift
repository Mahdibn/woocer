//
//  Image.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import RealmSwift

class ImageObject: Object, Codable {
    @objc dynamic var src: String = ""

    convenience init(src: String) {
        self.init()
        self.src = src
    }
}
