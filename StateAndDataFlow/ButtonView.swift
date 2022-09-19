//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Клоун on 19.09.2022.
//

import SwiftUI

struct ButtonView: View {
    let color: Color
    let action: () -> Void
    let title: String
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .buttonModify(color)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(color: .red, action: {}, title: "")
    }
}
