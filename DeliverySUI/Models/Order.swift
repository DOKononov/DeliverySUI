//
//  Order.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 12.01.24.
//

import Foundation

final class Order: ObservableObject {
    
    @Published var items: [Product] = []
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price}
    }
}
