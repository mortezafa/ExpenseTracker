//
//  ContentView.swift
//  expenseTracker
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Group {
                ExpenseTrackerView()
                    .tabItem {
                        Image(systemName: "eye")
                        Text("Expenses")
                    }
                BudgetView()
                    .tabItem {
                        Image(systemName: "list.bullet.clipboard")
                        Text("Budget")
                    }
                GraphView()
                    .tabItem {
                        Image(systemName: "chart.bar.xaxis")
                        Text("Graph")
                    }
            }
            .toolbarBackground(Color(hue: 1.0, saturation: 0.019, brightness: 0.24), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
        .background(.green, ignoresSafeAreaEdges: .all)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
