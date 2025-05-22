//
//  ExchangesViewModelSpy.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

@testable import MercadoBitcoin
import Foundation

class ExchangesViewModelSpy: ExchangesViewModel {

    var didLoadExchangesCalled = false
    
    public override init(service: ExchangesServicing) {
        super.init(service: service)
    }
    
    override func loadData() {
        super.loadData()
        didLoadExchangesCalled = true
    }
}
