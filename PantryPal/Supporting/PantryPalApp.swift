//
//  PantryPalApp.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 8/20/23.
//

import SwiftData
import SwiftUI

@main
struct PantryPalApp: App {
    let modelContainer: ModelContainer
    
    init() {
        do {
            modelContainer = try ModelContainer(for: InventoryItem.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(modelContainer)
        }
    }
}
