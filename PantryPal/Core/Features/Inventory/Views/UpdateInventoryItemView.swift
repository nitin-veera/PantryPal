//
//  InventoryItemInfoSheetView.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 8/21/23.
//

import SwiftUI

struct UpdateInventoryItemView: View {
    @Bindable var item: InventoryItem
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("How much is left?", selection: $item.amountRemaining) {
                    ForEach(AmountRemaining.allCases) { item in
                        Text(item.name)
                    }
                }
                .pickerStyle(.wheel)
            }
            .navigationTitle("How much is left?")
        }
    }
}

struct InventoryItemInfoSheetView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateInventoryItemView(item: InventoryItem(itemName: "ice cream",
                                                       itemType: .dessert,
                                                       storageType: .freezer))
    }
}
