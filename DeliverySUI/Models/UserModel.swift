//
//  UserModel.swift
//  DeliverySUI
//
//  Created by Dmitry Kononov on 11.01.24.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapkins = false
    var frequentRefills = false
}
