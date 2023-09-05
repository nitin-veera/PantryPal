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
    var itemType: ItemType
    var storageType: StorageType
    var amountRemaining: AmountRemaining
    
    init(itemName: String,
         itemType: ItemType,
         storageType: StorageType) {
        self.id = UUID()
        self.itemName = itemName
        self.purchaseDate = Date.now
        self.itemType = itemType
        self.storageType = storageType
        self.amountRemaining = .full
    }
}
