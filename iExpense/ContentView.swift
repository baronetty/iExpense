//
//  ContentView.swift
//  iExpense
//
//  Created by Leo  on 20.11.23.
//

import SwiftData
import SwiftUI


struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Model
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}



struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query private var expenses: Expenses
    @State private var showingAddExpense = false
    
    
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in // need that for delete stuff later on
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
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddView()
                } label: {
                    Label("Add Expense", systemImage: "plus")
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

#Preview {
    ContentView()
}
