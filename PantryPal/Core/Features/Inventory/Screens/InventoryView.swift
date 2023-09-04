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
        ZStack(alignment: .bottomTrailing) {
            Color.element.ignoresSafeArea()
            VStack (alignment: .leading ){
                searchAndNotis
                titleAndSlider
                    HStack (spacing: 30) {
                        Text("All")
                        ForEach(InventoryItem.StorageType.allCases, id: \.name) { storageType in
                            HStack {
                                Image(systemName: storageType.icon)
                                Text(storageType.name)
                            }
                        }
                    }
                    .font(.subheadline)
                    .padding(.horizontal)
                feedView
            }
            floatingButton
        }
        .environmentObject(viewModel)
    }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView()
    }
}

extension InventoryView {
    
    var feedView: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
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
            .padding(.top)
        }
    }
    
    var searchAndNotis: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .foregroundColor(.gray)
            Spacer()
            Image(systemName: "bell")
                .imageScale(.large)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
    
    var titleAndSlider: some View {
        HStack {
            Text("Pantry")
                .font(.largeTitle).bold()
            Spacer()
            Image(systemName: "slider.horizontal.3")
                .imageScale(.large)
                .foregroundColor(.gray)
        }
        .padding()
    }
    
    var floatingButton: some View {
        Button(action: {
            isPresentingForm.toggle()
        }) {
            Image(systemName: "plus")
                .imageScale(.large)
                .foregroundColor(.green)
        }
        .buttonStyle(SimpleButtonStyle())
        .padding()
        .sheet(isPresented: $isPresentingForm) {
            NewInventoryItemFormSheetView()
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
            .presentationCornerRadius(20)
        }
    }
}
