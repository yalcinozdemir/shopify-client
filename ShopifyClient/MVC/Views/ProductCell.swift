//
//  ProductCell.swift
//  ShopifyClient
//
//  Created by Yalcin Ozdemir on 2018-09-22.
//  Copyright © 2018 Yalcin. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    var productNameLabel:UILabel!
    var inventoryLabel:UILabel!
    var productPhoto:UIImageView!
    var displayingProduct:Product?{
        didSet{
            self.updateUI()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.configureImageView()
        self.configureLabels()
        self.addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI() {
        if let product = self.displayingProduct,
            let title = product.title,
            let photoURL = product.photoURL {
            self.productNameLabel?.text = title
            self.inventoryLabel.text = "\(UIConstants.Inventory) \(product.inventoryCount)"
            self.productPhoto.download(from: photoURL)
        }
    }
    
    func configureImageView() {
        productPhoto = UIImageView()
        productPhoto.backgroundColor = UIColor.red
        self.addSubview(productPhoto)
    }
    
    func configureLabels() {
        productNameLabel = UILabel()
        productNameLabel.numberOfLines = 0
        productNameLabel.textColor = UIColor.black
        self.addSubview(productNameLabel)
        
        inventoryLabel = UILabel()
        inventoryLabel.numberOfLines = 0
        inventoryLabel.textColor = UIColor.black
        self.addSubview(inventoryLabel)
    }
    
    func addConstraints() {
        self.productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.productPhoto.translatesAutoresizingMaskIntoConstraints = false
        self.inventoryLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([
            NSLayoutConstraint(item: productPhoto, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 75),
            NSLayoutConstraint(item: productPhoto, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 75),
            NSLayoutConstraint(item: productPhoto, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 10),
            NSLayoutConstraint(item: productPhoto, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 10),
            ])
        self.addConstraints([
            NSLayoutConstraint(item: productNameLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 20),
            NSLayoutConstraint(item: productNameLabel, attribute: .left, relatedBy: .equal, toItem: productPhoto, attribute: .right, multiplier: 1.0, constant: 10),
            NSLayoutConstraint(item: productNameLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 10),
            ])
        self.addConstraints([
            NSLayoutConstraint(item: inventoryLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 20),
            NSLayoutConstraint(item: inventoryLabel, attribute: .left, relatedBy: .equal, toItem: productPhoto, attribute: .right, multiplier: 1.0, constant: 10),
            NSLayoutConstraint(item: inventoryLabel, attribute: .top, relatedBy: .equal, toItem: productNameLabel, attribute: .bottom, multiplier: 1.0, constant: 10),
            ])
    }

    
}
