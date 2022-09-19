//
//  ButtonViewModifier.swift
//  StateAndDataFlow
//
//  Created by Клоун on 19.09.2022.
//

import SwiftUI

struct ButtonViewModifier: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 60)
            .background(color)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4))
    }
}

extension View {
    func buttonModify(_ color: Color) -> some View {
        ModifiedContent(content: self, modifier: ButtonViewModifier(color: color))
    }
}
