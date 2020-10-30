//
//  GetCurrency.swift
//  Domain
//
//  Created by ewerson castelo on 29/10/20.
//  Copyright © 2020 ewerson castelo. All rights reserved.
//

import Foundation

public protocol GetCurrency {
    func get(getCurrencyValue: GetCurrencyModel, completion: (Result<CurrencyModel, Error>) -> Void)
}

public struct GetCurrencyModel {
    public var countryName: String
    public var currency: Any
}
