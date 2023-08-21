//
//  NewItemFormSheetView.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 8/21/23.
//

import SwiftUI

struct NewInventoryItemFormSheetView: View {
    @EnvironmentObject var viewModel: InventoryViewModel
    @State private var name: String = ""
    @State private var type: InventoryItem.ItemType = .snack
    @State private var storage: InventoryItem.StorageType = .pantry
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Type the item's name...", text: $name)
                    Picker("Select the food type", selection: $type) {
                        ForEach(InventoryItem.ItemType.allCases) { item in
                            Text(item.name)
                        }
                    }
                    Picker("Select the storage method", selection: $storage) {
                        ForEach(InventoryItem.StorageType.allCases) { item in
                            Text(item.name)
                        }
                    }
                }
                Section {
                    Button("Add to Inventory") {
                        viewModel.InventoryItems.append(InventoryItem(itemName: name, itemType: type, storageType: storage))
                        name = ""
                        type = InventoryItem.ItemType.snack
                        storage = InventoryItem.StorageType.pantry
                    }
                }
            }
            .navigationBarTitle("New Item")
        }
    }
}

struct NewInventoryItemFormSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NewInventoryItemFormSheetView()
    }
}
