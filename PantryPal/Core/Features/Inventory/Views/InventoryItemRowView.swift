//
//  InventoryItem.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 8/20/23.
//

import SwiftUI
import SwiftData

struct InventoryItemRowView: View {
    @Environment(\.modelContext) var context
    
    @Bindable var item: InventoryItem
    
    var body: some View {
        HStack (alignment: .top, spacing: 0) {
            VStack {
                Text(item.itemType.icon)
                    .font(.title)
                    .padding(.top)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("\(item.itemName)")
                    .font(.title3).bold()
                Text("3 days in")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding([.leading, .top])
            Spacer()
            VStack(alignment: .trailing, spacing: 5) {
                Text(item.amountRemaining.message)
                    .font(.subheadline)
                    .foregroundColor(item.amountRemaining.color)
                Text("\(item.storageType.name)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.top)
        }
        .swipeActions {
            Button(role: .destructive) {
                withAnimation {
                    context.delete(item)
                }
            } label: {
                Label("Delete", systemImage:"trash")
                    .symbolVariant(.fill)
            }
        }
    }
}

#Preview {
    InventoryItemRowView(item: InventoryItem(itemName: "ice cream",
                                          itemType: .dessert,
                                          storageType: .freezer)
    )
}
