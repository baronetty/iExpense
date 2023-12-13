//
//  Expense.swift
//  iExpense
//
//  Created by Leo  on 13.12.23.
//

import Foundation
import SwiftData

@Model
class Expense {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}

