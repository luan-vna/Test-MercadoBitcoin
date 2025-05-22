//
//  ViewExtension.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

import UIKit

extension UIStackView {
    func addArrangedSubviewss(_ subviews: UIView...) {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addArrangedSubview($0)
        }
    }
    
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
