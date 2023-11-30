//
//  AddView.swift
//  iExpense
//
//  Created by Leo  on 21.11.23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
//    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var title = "Name"
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
//                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: title, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .disabled(title == "Name")
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
