//
//  NewItemFormSheetView.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 8/21/23.
//

import SwiftUI

struct CreateInventoryItemView: View {
    @State private var item = InventoryItem(itemName: "", itemType: .snack, storageType: .pantry)
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Type the item's name...", text: $item.itemName)
                    Picker("Select the food type", selection: $item.itemType) {
                        ForEach(ItemType.allCases) { item in
                            Text(item.name)
                        }
                    }
                    Picker("Select the storage method", selection: $item.storageType) {
                        ForEach(StorageType.allCases) { item in
                            Text(item.name)
                        }
                    }
                }
                Section {
                    Button("Add to Inventory") {
                        withAnimation {
                            context.insert(item)
                        }
                    }
                }
            }
            .navigationBarTitle("New Item")
        }
    }
}

#Preview {
    CreateInventoryItemView()
        .modelContainer(for: InventoryItem.self)
}
