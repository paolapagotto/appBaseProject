//
//  View+Extensions.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 30/11/2024.
//

import SwiftUI

extension View {
    func alert(for alertPath: Binding<AlertPath>) -> some View {
        self.modifier(AlertModifier(alertPath: alertPath))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
