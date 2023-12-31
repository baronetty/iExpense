//
//  AddView.swift
//  iExpense
//
//  Created by Leo  on 21.11.23.
//

import SwiftData
import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
//    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var title = "Name"
    
    @Query var expenses: [Expense]
    
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
                    let item = Expense(name: title, type: type, amount: amount)
                    modelContext.insert(item)
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
    AddView()
}
