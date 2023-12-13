//
//  StyleView.swift
//  iExpense
//
//  Created by Leo  on 13.12.23.
//

import SwiftUI


struct Style: ViewModifier {
    let amount: Double
    
    func body(content: Content) -> some View {
        content.foregroundColor(amountColor)
    }
    
    private var amountColor: Color {
        switch amount {
        case ..<10.0:
            return .green
        case ..<100.0:
            return .blue
        default:
            return .red
        }
    }
}

extension View {
    func amountStyle(amount: Double) -> some View {
        self.modifier(Style(amount: amount))
    }
}
