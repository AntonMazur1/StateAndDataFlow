//
//  DataStorage.swift
//  StateAndDataFlow
//
//  Created by Клоун on 19.09.2022.
//

import SwiftUI

final class DataStorage: ObservableObject {
    static let shared = DataStorage()
    
    @AppStorage("user") var userData: Data?
    
    private init() {}
    
    func saveUser(_ user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func loadUser() -> User {
        guard
            let user = try? JSONDecoder().decode(User.self, from: userData ?? Data())
        else { return User() }
        
        return user
    }
    
    func clear(_ userManager: UserManager) {
        userManager.user.name = ""
        userManager.user.isRegister = false
        userData = nil
    }
}
