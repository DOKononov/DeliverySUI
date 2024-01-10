//
//  AlertItem.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 10.01.24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text?
    let dismissButton: Alert.Button
    
    static let invalidURL = AlertItem(
        title: Text("Invalid URL"),
        message: nil,
        dismissButton: .default(Text("Ok")))
    
    static let invalidResponce = AlertItem(
        title: Text("Invalid Responce"),
        message: nil,
        dismissButton: .default(Text("Ok")))
    
    static let invalidData = AlertItem(
        title: Text("Invalid Data"),
        message: nil,
        dismissButton: .default(Text("Ok")))
    
    static let unexpectedError = AlertItem(
        title: Text("Unexpected Error"),
        message: nil,
        dismissButton: .default(Text("Ok")))
    
}


