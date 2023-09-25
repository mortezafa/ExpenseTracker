//
//  HeaderView.swift
//  expenseTracker
//

import SwiftUI

struct HeaderView: View {
    struct Column: View {
        let subtitle: String
        var body: some View {
            Spacer()
            VStack {
                Text("$0")
                    .foregroundColor(.white)
                Text(subtitle)
                    .foregroundColor(.white)
            }
            Spacer()
        }
    }
    var body: some View {
        HStack {
            Column(subtitle: "Income")
            Divider()
                .overlay(.white)
                .padding(.vertical, 10)
            Column(subtitle: "Expenses")
            Divider()
                .overlay(.white)
                .padding(.vertical, 10)
            Column(subtitle: "Balance")
        }
        .fixedSize(horizontal: false, vertical: true)

    }
}
