//
//  graph.swift
//  expenseTracker
//

import SwiftUI

struct GraphView: View {
    var body: some View {
        ZStack {
            Color.blue
            Image(systemName: "chart.bar.xaxis")
                .foregroundColor(.white)
                .font(.system(size: 100))
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct graph_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
