//
//  InventoryView.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 8/20/23.
//

import SwiftUI

struct InventoryView: View {
    @StateObject var viewModel = InventoryViewModel()
    @State private var isPresentingItem: InventoryItem? = nil
    @State private var isPresentingForm: Bool = false
    
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
                        InventoryItemInfoSheetView(item: item)
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
                    NewInventoryItemFormSheetView()
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
                    .presentationCornerRadius(20)
                }

            }
            .navigationTitle("Inventory")
        }
        .environmentObject(viewModel)
    }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView()
    }
}
