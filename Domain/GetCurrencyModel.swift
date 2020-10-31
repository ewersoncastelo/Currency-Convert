//
//  GetCurrencyModel.swift
//  Domain
//
//  Created by ewerson castelo on 31/10/20.
//  Copyright © 2020 ewerson castelo. All rights reserved.
//

import Foundation

public struct GetCurrencyModel: Encodable {
    var countryName: String
    var currency: Double
    
    public init(countryName: String, currency: Double){
        self.countryName = countryName
        self.currency = currency
    }
}
