//
//  ExchangesController.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-20.
//

import UIKit

class ExchangesController: UIViewController {
    
    private let viewModel: ExchangesViewModelProtocol
    var coordinator: ExchangeCoordinator?
    
    private lazy var mainView: ExchangesView = {
        let view = ExchangesView()
        view.delegate = self
        return view
    }()
    
    init(viewModel: ExchangesViewModelProtocol = ExchangesViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
        configure()
    }
    
    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = .title
        viewModel.loadData()
    }
}

extension ExchangesController: ViewConfigurable {
    
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

extension ExchangesController: ExchangesViewDelegate {
    
    func didSelectExchange(_ view: ExchangesView, exchange: Exchange) {
        coordinator?.show(exchange: exchange)
    }
}

extension ExchangesController: ViewLoadable {

    func showLoading() {
        mainView.showLoading()
    }
    
    func hideLoading() {
        mainView.hideLoading()
    }
    
    func showError(_ error: ErrorHandler) {
        let controller = UIAlertController(title: .errorTitle,
                                           message: error.localizedDescription,
                                           preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: .tryAgain,
                                           style: .default,
                                           handler: { [weak self] _ in
            self?.viewModel.loadData()
        }))
        present(controller, animated: true)
    }
}

extension ExchangesController: ExchangesViewModelDisplay {
    
    func exchangesLoaded(_ exchanges: [Exchange]) {
        mainView.load(exchanges: exchanges)
    }
}

private extension String {
    
    static let title = "Exchanges"
    static let errorTitle = "Oops!"
    static let tryAgain = "Tente novamente"
}
