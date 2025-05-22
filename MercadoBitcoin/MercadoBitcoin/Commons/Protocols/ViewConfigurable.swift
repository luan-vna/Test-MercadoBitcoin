//
//  ViewConfigurable.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

protocol ViewConfigurable: AnyObject {
    func configure()
    func addViews()
    func addConstraints()
    func additionalSetup()
}

extension ViewConfigurable {
    func configure() {
        addViews()
        addConstraints()
        additionalSetup()
    }
    
    func additionalSetup() { }
}
