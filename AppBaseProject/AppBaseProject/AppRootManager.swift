//
//  AppRootManager.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import SwiftUI

enum AppRoot: Hashable {
    case initial
    case login
    case tabBar
}

class AppRootManager: ObservableObject {
    @Published var currentRoot: AppRoot = .initial
}
