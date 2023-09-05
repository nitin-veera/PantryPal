//
//  AmountRemaining.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 9/5/23.
//

import Foundation
import SwiftUI

enum AmountRemaining: Int, CaseIterable, Identifiable {
    var id: Self {
        return self
    }
    
    case full
    case half
    case some
    case none
}

extension AmountRemaining {
    var message: String {
        switch self {
        case .full: return "Plenty left"
        case .half: return "Halfway there"
        case .some: return "Running low"
        case .none: return "All out"
        }
    }
    
    var color: Color {
        switch self {
        case .full: return .green
        case .half: return .yellow
        case .some: return .orange
        case .none: return .red
        }
    }
}
