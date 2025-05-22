//
//  CollectionExtension.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

import UIKit

extension Collection where Element: NSLayoutConstraint {
        
    func active() {
        forEach { $0.isActive = true }
    }
}
