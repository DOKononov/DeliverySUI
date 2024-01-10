//
//  HomeView.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 9.01.24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.products) { product in
                    ProductListCell(product: product)
                }
                .listStyle(.plain)
                .navigationTitle("🍟 Menu")
            }
            .onAppear {
                viewModel.getProducts()
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        
    }
    
    
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
