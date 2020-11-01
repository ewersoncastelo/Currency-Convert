//
//  HttpGetClient.swift
//  Data
//
//  Created by ewerson castelo on 31/10/20.
//  Copyright © 2020 ewerson castelo. All rights reserved.
//

import Foundation

// MARK: - Case Use Implement Protocol: RemoteGetCurrency
public protocol HttpGetClient {
    func get(to url: URL, with data: Data?)
}
