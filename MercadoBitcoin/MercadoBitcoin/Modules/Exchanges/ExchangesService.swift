//
//  ExchangesService.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

protocol ExchangesServicing {
    func allExchanges(completion: @escaping (Result<[Exchange], ErrorHandler>) -> Void)
}

class ExchangesService: ExchangesServicing {
    
    private let service: APIServicing
    
    init(service: APIServicing = APIService()) {
        self.service = service
    }
    
    func allExchanges(completion: @escaping (Result<[Exchange], ErrorHandler>) -> Void) {
        service.get(.allExchanges, completion: completion)
    }
}

private extension String {
    static let allExchanges = "/v1/exchanges"
}
