//
//  Product.swift
//  ShopifyClient
//
//  Created by Yalcin Ozdemir on 2018-09-22.
//  Copyright © 2018 Yalcin. All rights reserved.
//

import Foundation

class Product {
    
    var id: Int?
    var title:String?
    var photoURL:String?
    var inventoryCount:Int = 0
    var tags: [String]?
    
    init(data:[String:Any]) {
        if  let id = data[APIConstants.Data.Product.ID] as? Int,
            let title = data[APIConstants.Data.Product.Title] as? String,
            let tags = data[APIConstants.Data.Product.Tags] as? String {
            self.id = id
            self.title = title
            self.tags = tags.convertToArray()
        }
        if let variants = data[APIConstants.Data.Product.Variants] as? [[String:Any]] {
            for variant in variants {
                if let inventoryQuantity = variant[APIConstants.Data.Product.Variant.InventoryQuantity] as? Int {
                    inventoryCount += inventoryQuantity
                }
            }
        }
        if let image = data[APIConstants.Data.Product.Images] as? [String:Any] {
            if let src = image[APIConstants.Data.Product.Image.src] as? String {
                self.photoURL = src
            }
        }
    }
    
}
