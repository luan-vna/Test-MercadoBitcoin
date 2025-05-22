//
//  MercadoBitcoinUITests.swift
//  MercadoBitcoinUITests
//
//  Created by Luan Almeida on 2025-05-19.
//

import XCTest

final class TableViewUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    func testTapTableViewItem() {
        let app = XCUIApplication()
        app.activate()
        app/*@START_MENU_TOKEN@*/.staticTexts["Binance"]/*[[".cells.staticTexts[\"Binance\"]",".staticTexts[\"Binance\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let exchangesButton = app/*@START_MENU_TOKEN@*/.buttons["Exchanges"]/*[[".navigationBars.buttons[\"Exchanges\"]",".buttons.firstMatch",".buttons[\"Exchanges\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        exchangesButton.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Coinbase"]/*[[".cells.staticTexts[\"Coinbase\"]",".staticTexts[\"Coinbase\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        exchangesButton.tap()
    }
}
