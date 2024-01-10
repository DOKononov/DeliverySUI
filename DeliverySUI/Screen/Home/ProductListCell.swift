//
//  ProductListCell.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 9.01.24.
//

import SwiftUI

struct ProductListCell: View {
    
    let product: Product
    
    var body: some View {
        HStack {
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
                
                
            VStack(alignment: .leading, spacing: 5) {
                Text(product.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(product.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct ProductListCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductListCell(product: MockData.sample)
    }
}
