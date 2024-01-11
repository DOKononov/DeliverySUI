//
//  AppButton.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 11.01.24.
//

import SwiftUI

struct AppButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.appPrimary)
            .cornerRadius(10)
    }
}

struct AddToOrderButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(title: "$\(9.99, specifier: "%.2f") - Add To Order")
    }
}
