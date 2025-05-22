//
//  ViewIdentifier.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

protocol ViewIdentifier: AnyObject {
    static var identifier: String { get }
}

extension ViewIdentifier {
    static var identifier: String {
        String(describing: type(of: self))
    }
}
