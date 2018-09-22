//
//  APIRouter.swift
//  ShopifyClient
//
//  Created by Yalcin Ozdemir on 2018-09-22.
//  Copyright © 2018 Yalcin. All rights reserved.
//

import Foundation


class APIRouter {
    
    static let sharedInstace = APIRouter()
   
    func fetchProducts(completion: @escaping (_ products: [Product]) -> Void) {
        var productsList = [Product]()
        let url = URL(string: APIConstants.Main.APIUrl)
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? APIConstants.Error.GeneralError)
                    return }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                guard let jsonArray = jsonResponse as? [String: Any], let products = jsonArray[APIConstants.Data.Products] as? [[String: Any]] else {
                    print(APIConstants.Error.GeneralError)
                    return
                }
                for product in products {
                    let product = Product(data: product)
                    productsList.append(product)
                }
                completion(productsList)
            } catch let parsingError {
                print(APIConstants.Error.ParsingError, parsingError)
            }
        }
        task.resume()
    }
    
}
