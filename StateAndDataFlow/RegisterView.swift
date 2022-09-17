//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @AppStorage("username") private var userName = ""
    @AppStorage("isRegister") private var isRegister = false
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        HStack {
            VStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Button(action: registerUser) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("OK")
                    }
                }
                .disabled(name.count < 3)
            }
            Text("\(name.count)")
                .foregroundColor(changeTextColor())
        }
        .padding()
    }
    
    private func changeTextColor() -> Color {
        if (0...2).contains(name.count) {
            return .red
        } else {
            return .green
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister.toggle()
            userName = name
            isRegister = user.isRegister
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
