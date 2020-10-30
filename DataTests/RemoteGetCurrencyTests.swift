//
//  DataTests.swift
//  DataTests
//
//  Created by ewerson castelo on 29/10/20.
//  Copyright © 2020 ewerson castelo. All rights reserved.
//

import XCTest

// MARK: - Case Use Domain: GetCurrency
class RemoteGetCurrency {
    private let url: URL
    private let httpClient: HttpGetClient
    
    init(url: URL, httpClient: HttpGetClient) {
        self.url = url
        self.httpClient = httpClient
    }
    
    func get(){
        httpClient.get(url: url)
    }
}

// MARK: - Case Use Implement Protocol: RemoteGetCurrency
protocol HttpGetClient {
    func get(url: URL)
}

class RemoteGetCurrencyTests: XCTestCase {

    // MARK: - Case Use: Test GetCurrency
    func test_Check_URL_For_GetCurrency() throws {
        let url = URL(string: "https://api-test.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteGetCurrency(url: url, httpClient: httpClientSpy)
        sut.get()
    }
    
    // MARK: - Case Use: Create a mockup class for protocol
    class HttpClientSpy: HttpGetClient {
        var url: URL?
        
        func get(url: URL) {
            self.url =  url
        }
    }

}
