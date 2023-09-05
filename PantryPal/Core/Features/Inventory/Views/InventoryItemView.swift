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
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.element)
                .northWestShadow()
            HStack (spacing: 0) {
                VStack {
                    Text(item.itemType.icon)
                        .padding(.vertical)
                        .padding(.leading)
                        .font(.title)
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(item.itemName)")
                        .font(.title3).bold()
                    Text("3 days in")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                Spacer()
                VStack(alignment: .trailing, spacing: 5) {
                    Text(item.amountRemaining.message)
                        .font(.subheadline)
                        .foregroundColor(item.amountRemaining.color)
                    Text("\(item.storageType.name)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
            }
        }
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
