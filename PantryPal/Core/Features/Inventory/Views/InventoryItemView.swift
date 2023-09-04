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
                    Image(systemName: "takeoutbag.and.cup.and.straw")
                        .padding(.vertical)
                        .padding(.leading)
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
                    switch (item.amountRemaining) {
                    case .all:
                        Text("Plenty Left")
                            .font(.subheadline)
                    case .half:
                        Text("Halfway There")
                            .font(.subheadline)
                    case .few:
                        Text("Almost Out")
                            .font(.subheadline)
                    case .none:
                        Text("All Out")
                            .font(.subheadline)
                    }
                    Text("\(item.storageType.name)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
            }
        }
        .padding(.horizontal)
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
