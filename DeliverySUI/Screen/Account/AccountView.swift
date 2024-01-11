//
//  AccountView.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 9.01.24.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewmodel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $viewmodel.user.firstName)
                    TextField("Last Name", text: $viewmodel.user.lastName)
                    TextField("Email", text: $viewmodel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $viewmodel.user.birthday, displayedComponents: .date)
                    Button {
                        viewmodel.saveChanges()
                    } label: {
                        Text("Save changes")
                    }

                } header: {
                    Text("Personal Info")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewmodel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewmodel.user.frequentRefills)
                } header: {
                    Text("Request")
                }
                .toggleStyle(SwitchToggleStyle(tint: .appPrimary))

            }
                .navigationTitle("🙆‍♂️ Account")
        }
        .alert(item: $viewmodel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        .onAppear {
            viewmodel.getUser()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
