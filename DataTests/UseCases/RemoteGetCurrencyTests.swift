//
//  DataTests.swift
//  DataTests
//
//  Created by ewerson castelo on 29/10/20.
//  Copyright © 2020 ewerson castelo. All rights reserved.
//

import XCTest
import Domain
import Data

class RemoteGetCurrencyTests: XCTestCase {

    // MARK: - Case Use: Test GetCurrency
    func test_Check_URL() throws {
        let url = URL(string: "https://api-test.com")!
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.get(getCurrency: makeGetCurrencyModel())
        XCTAssertEqual(httpClientSpy.url, url)
        XCTAssertEqual(httpClientSpy.urlsCalls, 1)
    }
    
    // MARK: - Case Use: Test GetCurrency
    func test_Check_DATA() throws {
        let (sut, httpClientSpy) = makeSut()
        let getCurrencyModel = makeGetCurrencyModel()
        sut.get(getCurrency: getCurrencyModel)
        XCTAssertEqual(httpClientSpy.data, getCurrencyModel.toData())
    }
}

// MARK: - Case Use: Create a mockup class for protocol
extension RemoteGetCurrencyTests {
    
    // MARK: - Design Pattern: Factory
    func makeSut(url: URL = URL(string: "https://api-test.com")!) -> (sut: RemoteGetCurrency, httpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteGetCurrency(url: url, httpClient: httpClientSpy)
        return (sut, httpClientSpy)
    }
    
    func makeGetCurrencyModel() -> GetCurrencyModel {
        GetCurrencyModel(countryName: "CAD", currency: 1.34049)
    }
    
    class HttpClientSpy: HttpGetClient {
        var url: URL?
        var data: Data?
        var urlsCalls = 0
        
        func get(to url: URL, with data: Data?) {
            self.url =  url
            self.data = data
            self.urlsCalls += 1
        }
    }
}
