//
//  OrderView.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 9.01.24.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView {
            Text("Order view")
                .navigationTitle("🧾 Order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
