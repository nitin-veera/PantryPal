//
//  ItemType.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 9/5/23.
//

import Foundation

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
}

extension ItemType {
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
