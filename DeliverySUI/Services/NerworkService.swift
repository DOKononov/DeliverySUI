//
//  NerworkService.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 9.01.24.
//

import UIKit

enum NetworkError: Error {
    case invalidURL
    case invalidResponce
    case invalidData
    case unexpectedError
}

final class NerworkService {
    static let shared = NerworkService()
    private init() {}
    
    private let cache = NSCache<NSString, UIImage>()
    
    private let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
    func getProducts(comletion: @escaping (Result<[Product], NetworkError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            comletion(.failure(.invalidURL))
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard
                error == nil,
                let data
            else {
                comletion(.failure(.invalidResponce))
                return
            }
            
            guard
                let result = try? JSONDecoder().decode(ProductsResponce.self, from: data)
            else {
                comletion(.failure(.invalidData))
                return
            }
            
            comletion(.success(result.request))
            
        }
        .resume()
    }
    
    func downloadImage(from urlString: String, comletion: @escaping (UIImage?) -> Void) {
        let casheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: casheKey) {
            comletion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            comletion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { [weak self] data, responce, error in
            guard
                let data,
                let image = UIImage(data: data)
            else {
                comletion(nil)
                return
            }
            
            self?.cache.setObject(image, forKey: casheKey)
            comletion(image)
        }
        .resume()
    }
}



