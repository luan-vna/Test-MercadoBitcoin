//
//  Exchange.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

import Foundation

struct Exchange: Codable {
    let exchangeId: String
    let website: String
    let name: String
    let dataStart: String
    let dataEnd: String
    let dataQuoteStart: String
    let dataQuoteEnd: String
    let dataOrderbookStart: String
    let dataOrderbookEnd: String
    let dataTradeStart: String
    let dataTradeEnd: String
    let dataTradeCount: Int64
    let dataSymbolsCount: Int64
    let volume1HrsUsd: Double
    let volume1DayUsd: Double
    let volume1MthUsd: Double
    let metricId: [String]
    let icons: [ExchangeIcon]
}

struct ExchangeIcon: Codable {
    let exchangeId: String
    let assetId: String
    let url: String
}
