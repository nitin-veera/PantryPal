//
//  InventoryItemInfoSheetView.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 8/21/23.
//

import SwiftUI

struct InventoryItemDetailsView: View {
    private var item: InventoryItem
    
    init(item: InventoryItem) {
        self.item = item
    }
    
    var body: some View {
        Text("\(item.itemName)")
    }
}

struct InventoryItemInfoSheetView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryItemDetailsView(item: InventoryItem(itemName: "ice cream",
                                                       itemType: .dessert,
                                                       storageType: .freezer))
    }
}
