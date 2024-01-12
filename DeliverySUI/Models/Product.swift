//
//  ProductModel.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 9.01.24.
//

import Foundation

struct Product: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct ProductsResponce: Decodable {
    let request: [Product]
}

struct MockData {
    static let sample = Product(id: 1,
                                name: "Test",
                                description: "description",
                                price: 12,
                                imageURL: "",
                                calories: .random(in: 0...1000),
                                protein: .random(in: 0...100),
                                carbs: .random(in: 0...1000))
    
    static let sample2 = Product(id: 2,
                                name: "Test2",
                                description: "description",
                                price: 12,
                                imageURL: "",
                                calories: .random(in: 0...1000),
                                protein: .random(in: 0...100),
                                carbs: .random(in: 0...1000))
    
    static let sample3 = Product(id: 3,
                                name: "Test3",
                                description: "description",
                                price: 12,
                                imageURL: "",
                                calories: .random(in: 0...1000),
                                protein: .random(in: 0...100),
                                carbs: .random(in: 0...1000))
    
    static let sampleArray = [sample, sample2, sample3]
}
 
