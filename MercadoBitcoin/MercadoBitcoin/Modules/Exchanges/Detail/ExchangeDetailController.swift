//
//  ExchangeDetailController.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-20.
//

import UIKit

class ExchangeDetailController: UIViewController {
    
    private lazy var mainView: ExchangeDetailView = {
        let view = ExchangeDetailView()
        return view
    }()
    
    private let exchange: Exchange
    
    init(exchange: Exchange) {
        self.exchange = exchange
        super.init(nibName: nil, bundle: nil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.set(exchange: exchange)
    }
}

extension ExchangeDetailController: ViewConfigurable {
    
    func addViews() {
        view.addSubviews(mainView)
    }
    
    func addConstraints() {
        [
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].active()
    }
}
