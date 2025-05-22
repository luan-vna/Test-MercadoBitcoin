//
//  ExchangesViewModel.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-20.
//

import Foundation

protocol ExchangesViewModelProtocol: AnyObject {
    
    var service: ExchangesServicing? { get set }
 
    var delegate: (ExchangesViewModelDisplay & ViewLoadable)? { get set }
    
    func loadData()
}

protocol ExchangesViewModelDisplay: AnyObject {
    
    func exchangesLoaded(_ exchanges: [Exchange])
}

class ExchangesViewModel: ExchangesViewModelProtocol {
    var service: ExchangesServicing?
    
    init(service: ExchangesServicing = MockExchangesService()) {
        self.service = service
    }
    
//TODO: - Como comentado no e-mail: a minha chave API esta dando erro e solicitando para pagar, por este motivo estou usando o inicializador acima que ira retornar um mock.
//    init(service: ExchangesServicing = ExchangesService()) {
//        self.service = service
//    }
    
    weak var delegate: (ExchangesViewModelDisplay & ViewLoadable)?
    
    func loadData() {
        delegate?.showLoading()
        service?.allExchanges { [weak self] result in
            self?.delegate?.hideLoading()
            switch result {
            case .success(let exchanges):
                self?.delegate?.hideLoading()
                self?.delegate?.exchangesLoaded(exchanges)
            case .failure(let error):
                self?.delegate?.hideLoading()
                self?.delegate?.showError(error)
            }
        }
    }
}
