//
//  ProductListViewController.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import UIKit
import RxSwift
import RxCocoa

class ProductListViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(ProductTableViewCell.self)
        }
    }

    // MARK: - Variable
    var user: User!
    var viewModel: ProductListViewModel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        subscribe()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchProducts()
    }

    // MARK: - IBAction
    @IBAction func signOutBtnClicked(_ sender: Any) {
        if RealmService.shared.deleteAll() {
            coordinator?.gotoSignIn()
        }
    }
}

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}

// MARK: - Bindable
extension ProductListViewController: Bindable {
    func bindUI() {
        tableView.rx.setDelegate(self).disposed(by: bag)

        viewModel.products.bind(to: tableView.rx.items(cellIdentifier: ProductTableViewCell.reuseIdentifier, cellType: ProductTableViewCell.self)) { (row, model, cell) in
            cell.selectionStyle = .none
            cell.model = model
        }.disposed(by: bag)
    }

    func subscribe() {
        viewModel.products.subscribe(onError: { error in
            print(error.localizedDescription)
        }).disposed(by: bag)
    }
}
