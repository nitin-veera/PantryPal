//
//  InventoryItem.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 8/20/23.
//

import Foundation

struct InventoryItem: Identifiable {
    let id: UUID
    var itemName: String
    var purchaseDate: Date
    var expirationDate: Date?
    var itemType: ItemType
    var storageType: StorageType
    var amountRemaining: AmountRemaining
    
    init(itemName: String,
         expirationDate: Date? = nil,
         itemType: ItemType,
         storageType: StorageType) {
        self.id = UUID()
        self.itemName = itemName
        self.purchaseDate = Date.now
        self.expirationDate = expirationDate
        self.itemType = itemType
        self.storageType = storageType
        self.amountRemaining = .all
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
        case dessert
        
        var name: String {
            switch self {
            case .spice: return "Spice"
            case .fruit: return "Fruit"
            case .veggie: return "Vegetable"
            case .meat: return "Meat"
            case .meal: return "Meal"
            case .snack: return "Snack"
            case .dessert: return "Dessert"
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
        
        case all
        case half
        case few
        case none
        
        var name: String {
            switch self {
            case .all: return "All"
            case .half: return "Half"
            case .few: return "Few"
            case .none: return "None"
            }
        }
    }
}
