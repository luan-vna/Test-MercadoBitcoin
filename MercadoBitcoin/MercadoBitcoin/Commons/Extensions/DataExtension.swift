//
//  DataExtension.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

import Foundation

extension Data {
    
    func toObject<T: Decodable>() throws -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let data = try decoder.decode(T.self, from: self)
            return data
        } catch let error {
            dump(error)
        }
        return nil
    }
}
