//
//  ProductsViewController.swift
//  ShopifyClient
//
//  Created by Yalcin Ozdemir on 2018-09-22.
//  Copyright © 2018 Yalcin. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    var selectedTag: String?
    var products = [Product]()
    var reuseIdentifier = "productCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
        self.configureTableView()
        self.addConstraints()
        self.filterProducts()
    }
    
    func configureNavigationBar() {
        self.navigationItem.title = "\(UIConstants.ProductsFor) \(selectedTag ?? "")"
    }
    
    func configureTableView() {
        tableView = UITableView()
        tableView.rowHeight = 150
        tableView.backgroundColor = UIColor.white
        tableView.register(ProductCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(self.tableView)
    }
    
    func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([
            NSLayoutConstraint(item: tableView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0)
            ])
    }
    
    func filterProducts() {
        if let filterTag = selectedTag {
            self.products = products.filter({
                if let tags = $0.tags {
                    return tags.contains(filterTag)
                }
                return false
                
            })
        }
    }
    
    // UITableViewDataSource & UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ProductCell
        cell.layoutMargins = UIEdgeInsets.zero
        let product = self.products[indexPath.row]
        cell.displayingProduct = product
        return cell
    }
    


}
