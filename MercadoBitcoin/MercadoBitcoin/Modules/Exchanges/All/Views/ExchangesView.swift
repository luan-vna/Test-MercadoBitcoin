//
//  ExchangesView.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

import UIKit

protocol ExchangesViewDelegate: AnyObject {
    
    func didSelectExchange(_ view: ExchangesView, exchange: Exchange)
}

class ExchangesView: UIView {
    
    private var exchanges: [Exchange] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var loadingView: LoadingView = {
        let view = LoadingView()
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.register(ExchangesTableViewCell.self,
                      forCellReuseIdentifier: ExchangesTableViewCell.identifier)
        return view
    }()
    
    weak var delegate: ExchangesViewDelegate?
     
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    func load(exchanges: [Exchange]) {
        self.exchanges = exchanges
    }
    
    func showLoading() {
        loadingView.showLoading()
    }
    
    func hideLoading() {
        loadingView.hideLoading()
    }
}

extension ExchangesView: ViewConfigurable {
    func addViews() {
        addSubviews(tableView, loadingView)
    }
    
    func addConstraints() {
        [
            tableView.widthAnchor.constraint(equalTo: widthAnchor),
            tableView.heightAnchor.constraint(equalTo: heightAnchor)
        ].active()
        [
            loadingView.widthAnchor.constraint(equalTo: widthAnchor),
            loadingView.heightAnchor.constraint(equalTo: heightAnchor)
        ].active()
    }
    
    func additionalSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
}

extension ExchangesView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exchanges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExchangesTableViewCell.identifier) as? ExchangesTableViewCell else {
            return UITableViewCell()
        }
        cell.set(exchange: exchanges[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90.0
    }
}

extension ExchangesView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelectExchange(self, exchange: exchanges[indexPath.row])
    }
}
