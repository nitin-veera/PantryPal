//
//  InventoryItem.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 8/20/23.
//

import SwiftUI

struct InventoryItemView: View {
    var item: InventoryItem
    
    init(item: InventoryItem) {
        self.item = item
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 370, height: 70)
                .cornerRadius(20)
                .shadow(radius: 1)
            HStack {
                Text("\(item.itemName)")
                    .padding()
                    .font(.title3)
                Spacer()
                switch (item.amountRemaining) {
                case .all:
                    Text("Plenty Left")
                        .padding()
                        .font(.subheadline)
                case .half:
                    Text("Halfway There")
                        .padding()
                case .few:
                    Text("Almost Out")
                        .padding()
                case .none:
                    Text("All Out")
                        .padding()
                }
            }
        }
        .frame(width: 370, height: 70)
    }
}

struct InventoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryItemView(item: InventoryItem(itemName: "ice cream",
                                              itemType: .dessert,
                                              storageType: .freezer)
        )
    }
}
