//
//  DataTests.swift
//  DataTests
//
//  Created by ewerson castelo on 29/10/20.
//  Copyright © 2020 ewerson castelo. All rights reserved.
//

import XCTest
import Domain

// MARK: - Case Use Domain: GetCurrency
class RemoteGetCurrency {
    private let url: URL
    private let httpClient: HttpGetClient
    
    init(url: URL, httpClient: HttpGetClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func get(getCurrency: GetCurrencyModel) {
        let data = try? JSONEncoder().encode(getCurrency)
        httpClient.get(to: url, with: data)
    }
}

// MARK: - Case Use Implement Protocol: RemoteGetCurrency
protocol HttpGetClient {
    func get(to url: URL, with data: Data?)
}

class RemoteGetCurrencyTests: XCTestCase {

    // MARK: - Case Use: Test GetCurrency
    func test_Check_URL_For_GetCurrency() throws {
        let url = URL(string: "https://api-test.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteGetCurrency(url: url, httpClient: httpClientSpy)
        let getCurrencyModel = GetCurrencyModel(countryName: "CAD", currency: 1.34049)
        sut.get(getCurrency: getCurrencyModel)
        // check if url received for the client is equal to url get in the test
        XCTAssertEqual(httpClientSpy.url, url)
    }
    
    // MARK: - Case Use: Test GetCurrency
    func test_Check_DATA_For_GetCurrency() throws {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteGetCurrency(url: URL(string: "https://api-test.com")!, httpClient: httpClientSpy)
        let getCurrencyModel = GetCurrencyModel(countryName: "CAD", currency: 1.34049)
        sut.get(getCurrency: getCurrencyModel)
        let data = try? JSONEncoder().encode(getCurrencyModel)
        // check if url received for the client is equal to url get in the test
        XCTAssertEqual(httpClientSpy.data, data)
    }
}

// MARK: - Case Use: Create a mockup class for protocol
extension RemoteGetCurrencyTests {
    class HttpClientSpy: HttpGetClient {
        var url: URL?
        var data: Data?
        
        func get(to url: URL, with data: Data?) {
            self.url =  url
            self.data = data
        }
    }
}
