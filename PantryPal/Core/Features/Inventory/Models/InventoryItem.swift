//
//  InventoryItem.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 8/20/23.
//

import Foundation
import SwiftUI

struct InventoryItem: Identifiable {
    let id: UUID
    var itemName: String
    var purchaseDate: Date
    var itemType: Int
    var storageType: Int
    var amountRemaining: Int
    
    init(itemName: String,
         itemType: ItemType,
         storageType: StorageType) {
        self.id = UUID()
        self.itemName = itemName
        self.purchaseDate = Date.now
        self.itemType = itemType.rawValue
        self.storageType = storageType.rawValue
        self.amountRemaining = AmountRemaining.full.rawValue
    }
}

enum ItemType: Int, CaseIterable, Identifiable {
    var id: Self {
        return self
    }
    
    case spice
    case fruit
    case veggie
    case meat
    case meal
    case snack
    case dairy
    case dessert
    
    var name: String {
        switch self {
        case .spice: return "Spice"
        case .fruit: return "Fruit"
        case .veggie: return "Vegetable"
        case .meat: return "Meat"
        case .meal: return "Meal"
        case .snack: return "Snack"
        case .dairy: return "Dairy"
        case .dessert: return "Dessert"
        }
    }
    
    var icon: String {
        switch self {
        case .spice: return "🧂"
        case .fruit: return "🍇"
        case .veggie: return "🥦"
        case .meat: return "🥩"
        case .meal: return "🍕"
        case .snack: return "🥨"
        case .dairy: return "🥛"
        case .dessert: return "🍦"
        }
    }
}

enum StorageType: Int, CaseIterable, Identifiable {
    var id: Self {
        return self
    }
    
    case pantry
    case fridge
    case freezer
    
    var name: String {
        switch self {
        case .fridge: return "Fridge"
        case .pantry: return "Pantry"
        case .freezer: return "Freezer"
        }
    }
    
    var icon: String {
        switch self {
        case .pantry: return "cabinet"
        case .fridge: return "refrigerator"
        case .freezer: return "snowflake"
        }
    }
}

enum AmountRemaining: Int, CaseIterable, Identifiable {
    var id: Self {
        return self
    }
    
    case full
    case half
    case some
    case none
    
    var message: String {
        switch self {
        case .full: return "Plenty left"
        case .half: return "Halfway there"
        case .some: return "Running low"
        case .none: return "All out"
        }
    }
    
    var color: Color {
        switch self {
        case .full: return .green
        case .half: return .yellow
        case .some: return .orange
        case .none: return .red
        }
    }
}
