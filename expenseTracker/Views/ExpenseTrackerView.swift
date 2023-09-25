//
//  expenseTrackerView.swift
//  expenseTrackerView
//

import SwiftUI

struct ExpenseTrackerView: View {

    @State var newExpenseBottomSheet = false

    @State var expenses = [
        Expense(purchaseDate: Date(), category: .food, note: "Today was 10% off", amount: 1.10, image: Image(systemName: "fork.knife.circle.fill")),
        Expense(purchaseDate: Date(), category: .food, note: "Made with tofu", amount: 6, image: Image(systemName: "fork.knife.circle.fill")),
    ]

    var addButton: some View {
        Button {
            newExpenseBottomSheet.toggle()
        } label: {
            Image(systemName: "plus")
                .font(.title)
                .foregroundColor(.red)
                .aspectRatio(1, contentMode: .fit)
                .padding()
                .background(Color(white: 0.25))
                .clipShape(Circle())
        }
        .buttonStyle(.plain)
        .padding([.trailing, .bottom], 25)
        .sheet(isPresented: $newExpenseBottomSheet) {
            ExpenseSheet()
        }
    }

    var listView: some View {
        List {
            ForEach(expenses) { expense in
                Button {

                } label: {
                    HStack(spacing: 18) {
                        expense.image
                            .font(.title)

                        VStack(alignment: .leading, spacing: 8) {
                            Text(expense.category?.name ?? "lol")
                                .font(.title3)
                            Text(expense.note)
                            Text(expense.purchaseDate, format: .dateTime.month().day().year())
                                .font(.subheadline)
                        }

                        Spacer()

                        Text(expense.amount, format: .currency(code:"CAD").presentation(.narrow))
                            .font(.title2)
                    }
                }
                .listRowSeparatorTint(.white)
                .listRowBackground(Color(white: 0.2))
                .foregroundStyle(.white)
            }
        }
        .listStyle(.plain)
    }

    var datePickerView: some View {
        Button {

        } label: {
            HStack {
                Button {

                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.title)
                }

                Spacer()

                VStack(spacing: 6) {
                    Text("July 2023")
                    Text("12 Transactions")
                }
                .foregroundColor(.white)

                Spacer()

                Button {

                } label: {
                    Image(systemName: "chevron.forward")
                        .font(.title)
                }
            }
            .padding(.horizontal)
        }
        .buttonStyle(CapsuleButtonStyle())
        .tint(Color(white: 0.2))
        .padding()
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 28) {
                HeaderView()

                HStack {
                    Button {

                    } label: {
                        Label {
                            Text("Overview")
                        } icon: {
                            Image(systemName: "exclamationmark.3")
                                .rotationEffect(.degrees(90))
                        }
                    }
                    .buttonStyle(CapsuleButtonStyle())

                    Button {
                    } label: {
                        Label {
                            Text("Categories")
                        } icon: {
                            Image(systemName: "chart.pie.fill")
                                .rotationEffect(.degrees(90))
                        }
                    }
                    .buttonStyle(CapsuleButtonStyle())
                }
                .padding()

                VStack {
                    datePickerView
                    listView
                    addButton
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .background(Color(white: 0.1))
            }
            .background(.red)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                    }
                }

                ToolbarItem(placement: .principal) {
                    Text("Expense Tracker")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                }

                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .font(.title2)
                    }
                }
            }
            .toolbarBackground(.red, for: .navigationBar)
            .toolbarBackground(.hidden, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .tint(.white)
        }
    }

}

struct ExpenseTracker_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTrackerView()
    }
}
