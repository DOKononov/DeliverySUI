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
    @Published var isShowingDetail = false
    @Published var selectedProduct: Product?
    
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
                        self?.alertItem = AlertItem.Network.invalidData
                    case .invalidResponce:
                        self?.alertItem = AlertItem.Network.invalidResponce
                    case .invalidURL:
                        self?.alertItem = AlertItem.Network.invalidURL
                    case .unexpectedError:
                        self?.alertItem = AlertItem.Network.unexpectedError
                    }
                }
            }
        }
    }
}
