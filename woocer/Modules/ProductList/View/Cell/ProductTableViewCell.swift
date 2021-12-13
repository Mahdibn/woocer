//
//  ProductTableViewCell.swift
//  woocer
//
//  Created by Mehdi on 12/13/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell, ReusableView {
    @IBOutlet weak var productImageView: CustomImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!

    var model: Product? {
        didSet {
            if let imageUrl = model?.images.first?.src, let url = URL(string: imageUrl) {
                productImageView.downloadImageFrom(url: url, imageMode: .scaleAspectFit)
            }
            productNameLabel.text = model?.name ?? ""
            productPriceLabel.text = "$" + (model?.price ?? "0")
        }
    }
}
