//
//  DeliverySUIApp.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 9.01.24.
//

import SwiftUI

@main
struct DeliverySUIApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            DeliveryTabView().environmentObject(order)
        }
    }
}
