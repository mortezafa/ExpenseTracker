//
//  budget.swift
//  expenseTracker
//

import SwiftUI

struct BudgetView: View {
    var body: some View {
        ZStack {
            Color.green
            Image(systemName: "list.bullet.clipboard")
                .foregroundColor(.white)
                .font(.system(size: 100))
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct budget_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
    }
}
