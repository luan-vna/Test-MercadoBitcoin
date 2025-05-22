//
//  ExchangesCoordinator.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-20.
//

import UIKit

class ExchangeCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let controller = ExchangesController(viewModel: ExchangesViewModel())
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func show(exchange: Exchange) {
        let controller = ExchangeDetailController(exchange: exchange)
        navigationController.pushViewController(controller, animated: true)
    }
}
