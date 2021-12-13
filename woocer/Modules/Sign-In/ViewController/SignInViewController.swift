//
//  SignInViewController.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import UIKit

class SignInViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 9
        }
    }
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField! {
        didSet {
            websiteTextField.text = "https://wpt.woocer.com"
        }
    }
    @IBOutlet weak var consumerKeyTextField: UITextField! {
        didSet {
            consumerKeyTextField.text = "ck_85f212310cfff32728cc4c933331aa6bcf3002ef"
        }
    }
    @IBOutlet weak var consumerSecretTextField: UITextField! {
        didSet {
            consumerSecretTextField.text = "cs_ee784168289012a919a008985d2252fadecea2bb"
        }
    }

    // MARK: - Variables
    fileprivate let viewModel = SignInViewModel()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchUser()
    }

    // MARK: - IBActions
    @IBAction func signInBtnClicked(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else { return }
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let website = websiteTextField.text, !website.isEmpty else { return }
        guard let key = consumerKeyTextField.text, !key.isEmpty else { return }
        guard let secret = consumerSecretTextField.text, !secret.isEmpty else { return }
        
        let user = User(
            name: name,
            email: email,
            key: key,
            secret: secret,
            website: website
        )
        viewModel.saveUser(user)
        coordinator?.gotoProductList(user: user)
    }
}

extension SignInViewController: Bindable {
    func subscribe() {
        viewModel.user.subscribe(onNext: { [weak self] user in
            guard let self = self else { return }
            self.coordinator?.gotoProductList(user: user)
        }).disposed(by: bag)
    }
}
