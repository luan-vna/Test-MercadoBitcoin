//
//  BaseService.swift
//  MercadoBitcoin
//
//  Created by Luan Almeida on 2025-05-21.
//

import Foundation

import Foundation

protocol APIServicing: AnyObject {
    
    @discardableResult 
    func get<T: Decodable>(_ path: String, completion: @escaping (Result<T, ErrorHandler>) -> Void) -> URLSessionDataTask?
}

class APIService: APIServicing {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    @discardableResult
    func get<T: Decodable>(_ path: String, completion: @escaping (Result<T, ErrorHandler>) -> Void) -> URLSessionDataTask? {
        let url = urlComponent(path: path)
        let task = session.dataTask(with: URLRequest(url: url)) { data, response, error in
            DispatchQueue.main.async {
                if let result: T = try? data?.toObject() {
                    completion(.success(result))
                } else {
                    completion(.failure(ErrorHandler.invalidJSON))
                }
            }
        }
        task.resume()
        return task
    }
    
    private func urlComponent(path: String) -> URL {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = AppEnvironment.baseURL
        urlComponent.path = path
        urlComponent.queryItems = [URLQueryItem(name: "apiKey", value: AppEnvironment.apiKey)]
        guard let url = urlComponent.url else {
            fatalError(ErrorHandler.invalidURL.localizedDescription)
        }
        return url
    }
}

enum ErrorHandler: Error {
    case invalidURL
    case invalidJSON
    case invalidFile
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "URL inválida"
        case .invalidJSON:
            return "Erro ao carregar as informações."
        case .invalidFile:
            return "Erro ao carregar o arquivo."
        }
    }
}
