//
//  InventoryView.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 8/20/23.
//

import SwiftUI

struct InventoryView: View {
    @ObservedObject var viewModel = InventoryViewModel()
    @State private var isPresentingItem: InventoryItem? = nil
    @State private var isPresentingForm: Bool = false
    @State private var name: String = ""
    @State private var type: InventoryItem.ItemType = .snack
    @State private var storage: InventoryItem.StorageType = .pantry
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.InventoryItems, id: \.id) { item in
                        Button {
                            isPresentingItem = item
                        } label: {
                            InventoryItemView(item: item)
                        }
                        . buttonStyle(PlainButtonStyle())
                    }
                    .sheet(item: $isPresentingItem) { item in
                        Text("\(item.itemName)")
                            .presentationDetents([.height(300)])
                            .presentationDragIndicator(.visible)
                            .presentationCornerRadius(20)
                    }
                }
                Button("Add Item") {
                    isPresentingForm.toggle()
                }
                .padding()
                .sheet(isPresented: $isPresentingForm) {
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
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
                    .presentationCornerRadius(20)
                }

            }
            .navigationTitle("Inventory")
        }
    }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView()
    }
}
