//
//  Model.swift
//  Domain
//
//  Created by ewerson castelo on 31/10/20.
//  Copyright © 2020 ewerson castelo. All rights reserved.
//

import Foundation

public protocol Model: Encodable{
}

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}

