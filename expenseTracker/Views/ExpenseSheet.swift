// ExpenseSheet.swift

import SwiftUI

struct ExpenseSheet: View {
    @State private var categoryPopover = false
    @State private var accountPopover = false
    @State private var datePopever = false
    @State var selectedCategories: [Category] = []

    //    @FocusState private var noteFieldIsFocused = false

    struct Header: View {

//        static let currencyFormatter: NumberFormatter = {
//            let formatter = NumberFormatter()
//            formatter.numberStyle  = .currency
//            formatter.maximumFractionDigits = 2
//            return formatter
//        }()

        @Binding var amount: Double
        var body: some View {
            VStack {
                TextField("$0.00", value: $amount, format: .currency(code: "CAD").presentation(.narrow))
                    .keyboardType(.decimalPad)
                    .font(.system(size: 60))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .onChange(of: amount) { newValue in
                        print("newValue: \(newValue)")
                    }

                HStack {
                    Button {

                    } label: {
                        Text("Expense")
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .buttonStyle(CapsuleButtonStyle())
                    .tint(.red)

                    Button {

                    } label: {
                        Text("Income")
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .buttonStyle(CapsuleButtonStyle())
                    .tint(.red)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {

                    } label: {
                        Image(systemName: "xmark")
                            .font(.subheadline.weight(.bold))
                    }
                }

                ToolbarItemGroup(placement: .principal) {
                    Text("New Expense/Transaction")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                }
            }
        }
    }

    struct SaveButton: View {
        var body: some View {
            Button {

            } label: {
                Text("Save")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .buttonStyle(CapsuleButtonStyle())
            .padding()
            .background(Color(white: 0.2))
        }
    }

    struct CategoryPopover: View {
        @Binding var category: Expense.Category?
        var body: some View {
            VStack {
                List {
                    ForEach(Expense.Category.allCases) { category in
                        Button {
                            self.category = category
                        } label: {
                            HStack {
                                Image(systemName: category.systemImageName)
                                    .font(.title)

                                Text(category.name)
                            }
                            .frame(height: 50)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color(white: 0.4))
                        .foregroundStyle(.white)
                    }
                }
                .cornerRadius(15)
                .listStyle(PlainListStyle())
                .padding()
                .scrollDisabled(false)

            }
            .background(Color(white: 0.3))

        }
    }

    struct AccountPopover {
        var body: some View {

            VStack {
                List {
                    ForEach(Expense.Account.allCases) { account in
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: account.systemImageName)
                                    .font(.title)

                                Text(account.name)
                            }
                            .frame(height: 50)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color(white: 0.4))
                        .foregroundStyle(.white)
                    }
                }
                .cornerRadius(15)
                .listStyle(PlainListStyle())
                .padding()
                .scrollDisabled(false)

            }
            .background(Color(white: 0.3))
        }
    }

    @State var amount: Double?
    @State var selectedDate = Date()
    @State var expense = Expense(purchaseDate: Date(), category: nil, note: "", amount: 0, image: Image(systemName: "globe"))

    var body: some View {
        NavigationStack {
            VStack {
                Header(amount: $expense.amount)
                
                Divider()
                    .background(.white)
                List {
                    Button {
                        categoryPopover.toggle()
                    } label: {
                        HStack(spacing: 18) {
                            Image(systemName: "exclamationmark.3")
                                .font(.title)
                                .rotationEffect(.degrees(90))

                            VStack(alignment: .leading, spacing: 6) {
                                Text("Category: \(expense.category?.rawValue.capitalized ?? "")")
                            }
                        }
                        .frame(height: 50)
                    }
                    .listRowSeparatorTint(.white)
                    .listRowBackground(Color(white: 0.2))
                    .foregroundStyle(.white)
                    .sheet(isPresented: $categoryPopover, content: {
                        CategoryPopover(category: $expense.category)
                            .presentationDetents([.fraction(0.3)])
                    })



                    Button {
                        accountPopover.toggle()
                    } label: {
                        HStack(spacing: 18) {
                            Image(systemName: "dollarsign")
                                .font(.title)

                            VStack(alignment: .leading, spacing: 6) {
                                Text("From: ")
                            }
                        }
                        .frame(height: 50)
                    }
                    .listRowSeparatorTint(.white)
                    .listRowBackground(Color(white: 0.2))
                    .foregroundStyle(.white)
                    .sheet(isPresented: $accountPopover, content: {
                        AccountPopover()
                            .body.presentationDetents([.fraction(0.3), .fraction(0.6)])
                    })


                    Button {

                    } label: {
                        HStack(spacing: 18) {
                            Image(systemName: "list.bullet.clipboard")
                                .font(.title)

                            LabeledContent("") {
                                TextField("", text: $expense.note, prompt: Text("Note").foregroundColor(.white.opacity(0.3)))
                                    .textInputAutocapitalization(.never)
                                    .disableAutocorrection(true)
                                    .border(.clear)
                            }
                        }
                        .frame(height: 50)
                    }
                    .listRowSeparatorTint(.white)
                    .listRowBackground(Color(white: 0.2))
                    .foregroundStyle(.white)

                    Button {

                    } label: {
                        HStack(spacing: 18) {
                            Image(systemName: "calendar")
                                .font(.title)

                            let maxDate = Calendar.current.date(byAdding: .year, value: 30, to: .now)!

                            DatePicker(
                                "Select Date:",
                                selection: $selectedDate,
                                in: Date()...maxDate,
                                displayedComponents: [.date]
                            )
                            .datePickerStyle(.compact)
                            .tint(.red)
                            .preferredColorScheme(.dark)
                        }
                        .frame(height: 50)
                    }
                    .listRowSeparatorTint(.white)
                    .listRowBackground(Color(white: 0.2))
                    .foregroundStyle(.white)

                    Button {

                    } label: {
                        HStack(spacing: 18) {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .font(.title)

                            VStack(alignment: .leading, spacing: 6) {
                                Text("Never repeat ")
                            }
                        }
                        .frame(height: 50)
                    }
                    .listRowSeparatorTint(.white)
                    .listRowBackground(Color(white: 0.2))
                    .foregroundStyle(.white)
                }
                .scrollDisabled(false)
                SaveButton()
            }
            .listStyle(PlainListStyle())
            .background(Color(white: 0.2))
        }
    }
}


struct ExpenseSheet_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSheet()
            .tint(.white)
    }
}
