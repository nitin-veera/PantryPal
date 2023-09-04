//
//  ViewExtension.swift
//  PantryPal
//
//  Created by Nitin Veeraperumal on 9/3/23.
//
import SwiftUI

extension View {
    
    func northWestShadow( radius: CGFloat = 16, offset: CGFloat = 6 ) -> some View {
        return self
            .shadow(color: Color.white.opacity(0.7), radius: radius, x: -offset, y: -offset)
            .shadow(color: Color.black.opacity(0.2), radius: radius, x: offset, y: offset)
    }

    func southEastShadow(radius: CGFloat = 16, offset: CGFloat = 6) -> some View {
        return self
          .shadow(color: Color.black.opacity(0.2), radius: radius, x: -offset, y: -offset)
          .shadow(color: Color.white.opacity(0.7), radius: radius, x: offset, y: offset)
        }
}
