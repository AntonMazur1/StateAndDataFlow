//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import Foundation

class UserManager: ObservableObject {
    @Published var isRegister = UserDefaults.standard.bool(forKey: "isRegister")
    var name = UserDefaults.standard.string(forKey: "username")
}
