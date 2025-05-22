//
//  LoadingView.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

import UIKit

class LoadingView: UIView {
    
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.hidesWhenStopped = true
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    func showLoading() {
        loadingIndicator.startAnimating()
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.isHidden = false
        }
    }
    
    func hideLoading() {
        loadingIndicator.stopAnimating()
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.isHidden = true
        }
    }
}

extension LoadingView: ViewConfigurable {
    func addViews() {
        addSubviews(loadingIndicator)
    }
    
    func addConstraints() {
        [
            loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ].active()
    }
    
    func configure() {
        backgroundColor = .systemBackground
    }
}
