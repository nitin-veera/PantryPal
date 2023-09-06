//
//  InventoryView.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 8/20/23.
//

import SwiftData
import SwiftUI

struct InventoryView: View {
    @StateObject var viewModel = InventoryViewModel()
    @Query private var items: [InventoryItem]
    @State private var isPresentingItem: InventoryItem? = nil
    @State private var isPresentingForm: Bool = false
    @State private var selectedFilter: String = "All"
    @State private var searchQuery = ""
    @Namespace var animation
    
    var filteredItems: [InventoryItem] {
        if searchQuery.isEmpty {
            if selectedFilter == "All" { return items }
            let filteredItems = items.compactMap { item in
                return item.storageType.name == selectedFilter ? item : nil
            }
            return filteredItems
        }
        
        let filteredItems = items.compactMap { item in
            let nameContainsQuery = item.itemName.range(of: searchQuery, options: .caseInsensitive) != nil
            var storageTypeMatches = false
            if selectedFilter == "All" {
                storageTypeMatches = true
            } else if(item.storageType.name == selectedFilter) {
                storageTypeMatches = true
            }
            return (nameContainsQuery && storageTypeMatches) ? item : nil
        }
        
        return filteredItems
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                Color.element.ignoresSafeArea()
                VStack (alignment: .leading, spacing: 0){
                    // titleAndSearch
                    storageFilter
                    feedView
                }
                floatingButton
            }
            .navigationBarTitle("Inventory")
            .searchable(text: $searchQuery, placement: .navigationBarDrawer, prompt: "Search for an item")
        }
        .environmentObject(viewModel)
    }
}

extension InventoryView {
    
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
            Text("Inventory")
                .font(.largeTitle).bold()
            Spacer()
            Image(systemName: "slider.horizontal.3")
                .imageScale(.large)
                .foregroundColor(.gray)
        }
        .padding()
    }
    
    var titleAndSearch: some View {
        HStack {
            Text("Inventory")
                .font(.largeTitle).bold()
            Spacer()
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .foregroundColor(.gray)
        }
        .padding()
    }
    
    var storageFilter: some View {
        HStack {
            VStack {
                Text("All")
                    .foregroundColor(selectedFilter == "All" ? .green : .black)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            self.selectedFilter = "All"
                        }
                }
                if selectedFilter == "All" {
                    Capsule()
                        .foregroundColor(.green)
                        .frame(height: 3)
                        .matchedGeometryEffect(id: "filter", in: animation)
                } else {
                    Capsule()
                        .foregroundColor(Color(.clear))
                        .frame(height: 3)
                }
            }
            ForEach(StorageType.allCases, id: \.name) { storageType in
                HStack {
                    VStack {
                        HStack {
                            Image(systemName: storageType.icon)
                            Text(storageType.name)
                        }
                        .foregroundColor(selectedFilter == storageType.name ? .green : .black)
                        
                        if selectedFilter == storageType.name {
                            Capsule()
                                .foregroundColor(.green)
                                .frame(height: 3)
                                .matchedGeometryEffect(id: "filter", in: animation)
                        } else {
                            Capsule()
                                .foregroundColor(Color(.clear))
                                .frame(height: 3)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            self.selectedFilter = storageType.name
                        }
                    }
                }
            }
        }
        .font(.subheadline)
        .padding(.horizontal)
        .padding(.bottom, 0)
    }
    
    var feedView: some View {
        List {
            ForEach(filteredItems) { item in
                InventoryItemRowView(item: item)
                .contentShape(RoundedRectangle(cornerRadius: 20))
                .onTapGesture {
                    isPresentingItem = item
                }
            }
            .listRowBackground(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .padding(.vertical, 4)
            )
            .listRowSeparator(.hidden)
            .sheet(item: $isPresentingItem) { item in
                InventoryItemDetailsView(item: item)
                    .presentationDetents([.height(300)])
                    .presentationDragIndicator(.visible)
                    .presentationCornerRadius(20)
            }
        }
        .padding()
        .listStyle(PlainListStyle())
        .scrollContentBackground(.hidden)
    }
    
    var floatingButton: some View {
        VStack {
            Spacer()
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
                CreateInventoryItemView()
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(20)
            }
        }
    }
}

#Preview {
    InventoryView()
}
