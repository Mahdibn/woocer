//
//  User.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import RealmSwift

class User: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var key: String = ""
    @objc dynamic var secret: String = ""
    @objc dynamic var website: String = ""

    convenience init(
        name: String,
        email: String,
        key: String,
        secret: String,
        website: String
    ) {
        self.init()
        self.name = name
        self.email = email
        self.key = key
        self.secret = secret
        self.website = website
    }
}
