//
//  Database.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import RealmSwift

class RealmService {
    static let shared = RealmService()
    private init() {}

    let realm = try! Realm()

    func create<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func delete<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func deleteAll() -> Bool {
        do {
            try realm.write {
                realm.deleteAll()
            }
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}
