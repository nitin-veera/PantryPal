//
//  ContentView.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 8/20/23.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var inventoryItems: FetchedResults<InventoryItem>

    var body: some View {
            InventoryView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
