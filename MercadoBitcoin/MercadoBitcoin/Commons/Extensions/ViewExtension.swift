//
//  ViewExtension.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}
