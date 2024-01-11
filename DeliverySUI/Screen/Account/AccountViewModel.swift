//
//  AccountViewModel.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 11.01.24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertItem.Account.emptyFormField
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertItem.Account.incorrectEmail
            return false
        }
        alertItem = nil
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        guard let data = try? JSONEncoder().encode(user) else {
            alertItem = AlertItem.Account.userEncodeIssue
            return
        }
        userData = data
        alertItem = AlertItem.Account.userSaved
    }
    
    func getUser() {
        
        guard let userData else { return }
        
        guard let user = try? JSONDecoder().decode(User.self, from: userData) else {
            alertItem = AlertItem.Account.userEncodeIssue
            return
        }
        
        self.user = user
    }
    
}
