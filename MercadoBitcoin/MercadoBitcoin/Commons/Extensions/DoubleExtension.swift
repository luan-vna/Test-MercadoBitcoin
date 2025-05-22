//
//  ViewExtension.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

import UIKit

extension Double {
    
    internal static var formatterUSD: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }
    
    func toUSDCurrency() -> String {
        return Double.formatterUSD.string(from: NSNumber(value: self)) ?? "$0.00"
    }
}
