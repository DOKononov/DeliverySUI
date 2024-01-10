//
//  HomeViewModel.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 10.01.24.
//

import SwiftUI


final class HomeViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    func getProducts() {
        isLoading = true
        NerworkService.shared.getProducts { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let products):
                    self?.products = products
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self?.alertItem = AlertItem.invalidData
                    case .invalidResponce:
                        self?.alertItem = AlertItem.invalidResponce
                    case .invalidURL:
                        self?.alertItem = AlertItem.invalidURL
                    case .unexpectedError:
                        self?.alertItem = AlertItem.unexpectedError
                    }
                }
            }
        }
    }
}
