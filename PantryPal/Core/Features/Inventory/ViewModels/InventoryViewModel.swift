//
//  InventoryViewModel.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 8/20/23.
//

import Foundation

class InventoryViewModel: ObservableObject {
    
    @Published var InventoryItems = [
        InventoryItem(itemName: "apple", itemType: .fruit, storageType: .pantry),
        InventoryItem(itemName: "broccoli", itemType: .veggie, storageType: .fridge),
        InventoryItem(itemName: "dino nuggets", itemType: .meal, storageType: .freezer),
        InventoryItem(itemName: "pepper", itemType: .spice, storageType: .pantry),
        InventoryItem(itemName: "belvita", itemType: .snack, storageType: .pantry),
        InventoryItem(itemName: "ice cream", itemType: .dessert, storageType: .freezer),
    ]
}
