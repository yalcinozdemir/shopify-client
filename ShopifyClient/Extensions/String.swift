//
//  String.swift
//  ShopifyClient
//
//  Created by Yalcin Ozdemir on 2018-09-22.
//  Copyright © 2018 Yalcin. All rights reserved.
//

import Foundation

extension String {
    
    func convertToArray() -> [String] {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        return trimmedString.components(separatedBy: ",")
    }
    
}
