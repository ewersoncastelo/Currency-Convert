//
//  GetCurrency.swift
//  Domain
//
//  Created by ewerson castelo on 29/10/20.
//  Copyright © 2020 ewerson castelo. All rights reserved.
//

import Foundation

public protocol GetCurrency {
    func get(getCurrency: GetCurrencyModel, completion: @escaping (Result<CurrencyModel, Error>) -> Void)
}

public struct GetCurrencyModel: Encodable {
    var countryName: String
    var currency: Double
    
    public init(countryName: String, currency: Double){
        self.countryName = countryName
        self.currency = currency
    }
}
