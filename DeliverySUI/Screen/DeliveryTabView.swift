//
//  ContentView.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 9.01.24.
//

import SwiftUI

struct DeliveryTabView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .tint(.appPrimary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryTabView()
    }
}
