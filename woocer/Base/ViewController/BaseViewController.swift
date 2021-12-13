//
//  BaseViewController.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    let bag = DisposeBag()
}
