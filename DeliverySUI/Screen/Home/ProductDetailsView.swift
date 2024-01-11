//
//  ProductDetailsView.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 10.01.24.
//

import SwiftUI

struct ProductDetailsView: View {
    let product: Product
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            ProductRemoteImage(urlString: product.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(product.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(product.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    ProductInfo(title: "Calories", value: product.calories)
                    ProductInfo(title: "Carbs", value: product.carbs)
                    ProductInfo(title: "Protein", value: product.protein)
                }
            }
            
            Spacer()
            
            Button {
                //TODO: logic
            } label: {
                AppButton(title: "$\(product.price, specifier: "%.2f") - Add To Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 535)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button(action: {
            isShowingDetail = false
        }, label: {
            DissmisButton()
        }), alignment: .topTrailing)
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: MockData.sample, isShowingDetail: .constant(true))
    }
}


struct ProductInfo: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
