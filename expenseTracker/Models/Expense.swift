//
//  Expense.swift
//  expenseTracker
//

import Foundation
import SwiftUI

struct Expense: Identifiable {

    let id = UUID()

    enum Category: String, CaseIterable, Identifiable {
        case food, entertainment, electronics, shopping
        var id: String {
            rawValue
        }
        var name: String {
            rawValue.capitalized
        }

        var systemImageName: String {
            switch self {
            case .food: return "fork.knife.circle.fill"
            case .entertainment: return "popcorn.fill"
            case .electronics: return "macbook.and.iphone"
            case .shopping: return "handbag.fill"
            }
        }
    }

    enum Account: String, CaseIterable, Identifiable {
        case chequing, saving
        var id: String {
            rawValue
        }
        var name: String {
            switch self {
            case .chequing:
                return "Chequing Account"
            case .saving:
                return "Savings Account"
            }
        }
        var systemImageName: String {
            switch self {
            case .chequing: return "placeholdertext.fill"
            case .saving: return "placeholdertext.fill"
            }
        }
    }

    var purchaseDate: Date

    var fromAccount: Account?

    var category: Category?

    var note: String

    var amount: Double

    var image: Image

    //enum of categaory


}

//mutiple states, add to an expense array, add that to expense

//dummy expense object, 

/// To learn:
///
/// optionals --> bindings
/// differance between types and variables. Naming: Types == CaptialCase Variables == camalCase
/// Learn about 3 types, enums, structs, and classes
/// Learn what an Instance is. learn what "instance" means "instantiate" and "init"
/// Learn "name spacing"
/// Bindings and State
