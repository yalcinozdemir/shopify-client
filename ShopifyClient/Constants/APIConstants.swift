//
//  APIConstants.swift
//  ShopifyClient
//
//  Created by Yalcin Ozdemir on 2018-09-22.
//  Copyright © 2018 Yalcin. All rights reserved.
//

import Foundation

struct APIConstants {
    
    struct Main {
        static let APIUrl = "https://shopicruit.myshopify.com/admin/products.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
    }
    
    struct Data {
        static let Products = "products"
        struct Product {
            static let Tags = "tags"
            static let ID = "id"
            static let Title = "title"
            static let Variants = "variants"
            struct Variant {
                static let InventoryQuantity = "inventory_quantity"
            }
            static let Images = "image"
            struct Image {
                static let src = "src"
            }
        }
    }
    
    struct Error {
        static let GeneralError = "General Error"
        static let ParsingError = "Parsing Error"
    }
    
}
