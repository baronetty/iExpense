//
//  ContentView.swift
//  iExpense
//
//  Created by Leo  on 20.11.23.
//

import SwiftData
import SwiftUI


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var expenses: [Expense]
    
    @State private var showingAddExpense = false
    @State private var showingTypeOnly = false
    @State private var sortOrder = [
        SortDescriptor(\Expense.name),
        SortDescriptor(\Expense.amount)
    ]
    
    
    
    
    var body: some View {
        NavigationStack() {
            UsersView(filter: showingTypeOnly ? "Personal" : "Business", sortOrder: sortOrder)
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddView()
                } label: {
                    Label("Add Expense", systemImage: "plus")
                }
                
                Button(showingTypeOnly ? "Show Personal" : "Show Everyone") {
                    showingTypeOnly.toggle()
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down"){
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\Expense.name),
                                SortDescriptor(\Expense.amount)
                            ])
                        Text("Sort by Amount")
                            .tag([
                                SortDescriptor(\Expense.amount),
                                SortDescriptor(\Expense.amount)
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
