//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        HStack {
            VStack {
                TextField("Enter your name", text: $userManager.user.name)
                    .multilineTextAlignment(.center)
                Button(action: registerUser) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("OK")
                    }
                }
                .disabled(!userManager.nameIsValid)
            }
            Text("\(userManager.user.name.count)")
                .foregroundColor(userManager.nameIsValid ? .green : .red)
        }
        .padding()
    }
    
    private func registerUser() {
        userManager.user.isRegister.toggle()
        DataStorage.shared.saveUser(userManager.user)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
