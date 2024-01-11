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
    
    enum Network {}
    enum Account {}
}

extension AlertItem.Network {
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

extension AlertItem.Account {
    static let emptyFormField = AlertItem(
        title: Text("Empty field"),
        message: Text("Fill in all fields"),
        dismissButton: .default(Text("Ok")))
    
    static let incorrectEmail = AlertItem(
        title: Text("Wrong email address"),
        message: Text("Please chack email address"),
        dismissButton: .default(Text("Ok")))
    
    static let userEncodeIssue = AlertItem(
        title: Text("Something went wrong"),
        message: Text("Unable to save or load profile"),
        dismissButton: .default(Text("Ok")))
    
    static let userSaved = AlertItem(
        title: Text("Profile saved"),
        message: nil,
        dismissButton: .default(Text("Ok")))
    
}
