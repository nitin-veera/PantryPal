//
//  StorageType.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 9/5/23.
//

import Foundation

enum StorageType: Int, CaseIterable, Identifiable, Codable {
    var id: Self {
        return self
    }
    
    case pantry
    case fridge
    case freezer
}

extension StorageType {
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
