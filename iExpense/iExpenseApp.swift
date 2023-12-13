//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Leo  on 20.11.23.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expenses.self)
    }
}
