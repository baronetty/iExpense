//
//  UsersView.swift
//  iExpense
//
//  Created by Leo  on 13.12.23.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]
    
    var body: some View {
        List {
            ForEach(expenses) { item in // need that for delete stuff later on
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        
                        Text(item.type)
                    }
                    
                    
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .amountStyle(amount: item.amount)
                }
            }
            .onDelete(perform: removeItems)
        }
    }
   
    init(filter: String, sortOrder: [SortDescriptor<Expense>]) {
        _expenses = Query(filter: #Predicate<Expense> { expense in
            expense.type >= filter
        }, sort: sortOrder)
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let expense = expenses[offset]
            modelContext.delete(expense)
        }
    }
}

#Preview {
    UsersView(filter: "Personal", sortOrder: [SortDescriptor(\Expense.name)])
        .modelContainer(for: Expense.self)
}
