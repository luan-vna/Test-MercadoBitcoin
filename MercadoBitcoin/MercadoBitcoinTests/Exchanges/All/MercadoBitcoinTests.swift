//
//  MercadoBitcoinTests.swift
//  MercadoBitcoinTests
//
//  Created by Luan Almeida on 2025-05-19.
//

import XCTest
@testable import MercadoBitcoin

final class MercadoBitcoinTests: XCTestCase {

    func testItemsLoaded() throws {
        let viewModel = ExchangesViewModelSpy(service: MockExchangesService())
        viewModel.loadData()
        XCTAssert(viewModel.didLoadExchangesCalled)
    }
}
