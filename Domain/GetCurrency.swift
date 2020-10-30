//
//  GetCurrency.swift
//  Domain
//
//  Created by ewerson castelo on 29/10/20.
//  Copyright © 2020 ewerson castelo. All rights reserved.
//

import Foundation

protocol GetCurrency {
    func get(getCurrencyValue: GetCurrencyModel, completion: (Result<CurrencyModel, Error>) -> Void)
}

struct GetCurrencyModel {
    var countryName: String
    var currency: Any
}
