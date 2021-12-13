//
//  SignInViewModel.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import RxSwift

class SignInViewModel: BaseViewModel {
    let user = PublishSubject<User>()
    
    func saveUser(_ user: User) {
        RealmService.shared.create(user)
    }

    func fetchUser() {
        let realm = RealmService.shared.realm
        if let user = realm.objects(User.self).first {
            self.user.onNext(user)
        }
    }
}
