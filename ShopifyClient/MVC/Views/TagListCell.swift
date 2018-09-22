//
//  TagListCell.swift
//  ShopifyClient
//
//  Created by Yalcin Ozdemir on 2018-09-22.
//  Copyright © 2018 Yalcin. All rights reserved.
//

import UIKit

class TagListCell: UICollectionViewCell {
    
    var tagLabel:UILabel!
    var displayingTag:String?{
        didSet{
            self.updateUI()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.configureLabel()
        self.addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI() {
        if let tag = self.displayingTag {
            self.tagLabel?.text = tag
        }
    }
    
    func configureLabel() {
        tagLabel = UILabel()
        tagLabel.numberOfLines = 1
        tagLabel.adjustsFontSizeToFitWidth = true
        tagLabel.layer.borderColor = UIColor.black.cgColor
        tagLabel.layer.borderWidth = 2
        tagLabel.layer.cornerRadius = 10
        tagLabel.textAlignment = .center
        tagLabel.clipsToBounds = true
        tagLabel.textColor = UIColor.black
        self.addSubview(tagLabel)
    }
    
    func addConstraints() {
        self.tagLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([
            NSLayoutConstraint(item: tagLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: tagLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 10),
            NSLayoutConstraint(item: tagLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -10),
            NSLayoutConstraint(item: tagLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0),
            ])
    }
    
}
