//
//  ViewController.swift
//  ShopifyClient
//
//  Created by Yalcin Ozdemir on 2018-09-22.
//  Copyright © 2018 Yalcin. All rights reserved.
//

import UIKit

class TagsListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    var tags = [String]()
    var products = [Product]()
    let reuseIdentifier = "tagCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
        self.configureCollectionView()
        self.retrieveProducts()
    }
    
    func configureNavigationBar() {
        self.navigationItem.title = UIConstants.Tags
    }
    
    func retrieveProducts() {
        APIRouter.sharedInstace.fetchProducts { (products) in
            self.products = products
            if let tagsArray = self.parseTags(products: products) {
                self.tags = tagsArray
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func parseTags(products: [Product]) -> [String]? {
        var tagsArray = [String]()
        if let productTags =  products.map({ $0.tags }) as? [[String]] {
            for tags in productTags {
                tagsArray.append(contentsOf: tags)
            }
            let uniqueTags = Array(Set(tagsArray))
            return uniqueTags
        }
        return nil
    }
    
    //MARK: UICollectionViewDelegate
    
    func configureCollectionView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        collectionViewLayout.itemSize = CGSize(width: 110, height: 30)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: collectionViewLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TagListCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TagListCell
        cell.backgroundColor = UIColor.clear
        cell.displayingTag = self.tags[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ProductsViewController()
        vc.products = self.products
        vc.selectedTag = tags[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }



}

