//
//  ViewLoadable.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

protocol ViewLoadable: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(_ error: ErrorHandler)
}
