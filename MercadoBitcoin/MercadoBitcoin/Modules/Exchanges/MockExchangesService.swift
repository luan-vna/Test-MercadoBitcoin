//
//  ExchangesService.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

import Foundation

class MockExchangesService: ExchangesServicing {
    
    private let service: APIServicing
    
    init(service: APIServicing = APIService()) {
        self.service = service
    }
    
    func allExchanges(completion: @escaping (Result<[Exchange], ErrorHandler>) -> Void) {
        guard let url = Bundle.main.url(forResource: "exchanges", withExtension: "json") else {
            completion(.failure(ErrorHandler.invalidJSON))
            return
        }
        guard let data = try? Data(contentsOf: url), let response: [Exchange] = try? data.toObject() else {
            completion(.failure(ErrorHandler.invalidJSON))
            return
        }
        completion(.success(response))
    }
}
