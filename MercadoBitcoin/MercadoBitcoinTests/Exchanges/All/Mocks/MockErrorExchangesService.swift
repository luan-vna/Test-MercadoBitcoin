//
//  MockErrorExchangesService.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

@testable import MercadoBitcoin

import Foundation

class MockErrorExchangesService: ExchangesServicing {
    
    private let service: APIServicing
    
    init(service: APIServicing = APIService()) {
        self.service = service
    }
    
    func allExchanges(completion: @escaping (Result<[Exchange], ErrorHandler>) -> Void) {
        //Nome do arquivo invalido
        guard let url = Bundle.main.url(forResource: "invalidName", withExtension: "json") else {
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
