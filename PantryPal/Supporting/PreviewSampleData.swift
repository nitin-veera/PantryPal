//
//  PreviewSampleData.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 9/5/23.
//

import SwiftUI
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    
    do {
        let container = try ModelContainer(for: InventoryItem.self, configurations: config)
        for item in sampleItems {
            container.mainContext.insert(item)
        }
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()


let sampleItems = [
    InventoryItem(itemName: "Broccoli", itemType: .veggie, storageType: .fridge),
    InventoryItem(itemName: "Steak", itemType: .meat, storageType: .freezer),
    InventoryItem(itemName: "Ice Cream", itemType: .dessert, storageType: .freezer),
    InventoryItem(itemName: "Pasta", itemType: .meal, storageType: .pantry),
]
