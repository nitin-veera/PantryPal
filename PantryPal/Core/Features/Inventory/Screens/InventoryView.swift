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
    @State private var selectedFilter: String = "All"
    @Namespace var animation
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.element.ignoresSafeArea()
            VStack (alignment: .leading, spacing: 0){
                searchAndNotis
                titleAndSlider
                    HStack {
                        VStack {
                            Text("All")
                                .fontWeight(selectedFilter == "All" ? .semibold : .regular)
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
                        ForEach(InventoryItem.StorageType.allCases, id: \.name) { storageType in
                            HStack {
                                VStack {
                                    HStack {
                                        Image(systemName: storageType.icon)
                                        Text(storageType.name)
                                    }
                                    .fontWeight(selectedFilter == storageType.name ? .semibold : .regular)
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
