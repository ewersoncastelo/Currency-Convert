//
//  RemoteGetCurrency.swift
//  Data
//
//  Created by ewerson castelo on 31/10/20.
//  Copyright © 2020 ewerson castelo. All rights reserved.
//

import Foundation
import Domain

// MARK: - Case Use Domain: GetCurrency
public final class RemoteGetCurrency {
    private let url: URL
    private let httpClient: HttpGetClient
    
    public init(url: URL, httpClient: HttpGetClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    public func get(getCurrency: GetCurrencyModel) {
        let data = try? JSONEncoder().encode(getCurrency)
        httpClient.get(to: url, with: data)
    }
}
