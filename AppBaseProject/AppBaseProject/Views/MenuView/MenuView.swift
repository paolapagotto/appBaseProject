//
//  MenuView.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import SwiftUI

class MenuViewConfigurator {
    @ViewBuilder
    func setup(coordinator: MenuCoordinator) -> some View {
        let viewModel = MenuViewModel()
        MenuView(coordinator: coordinator, viewModel: viewModel)
    }
}

class MenuViewModel: ObservableObject {
}

struct MenuView: View {
    @StateObject var coordinator: MenuCoordinator
    @StateObject var viewModel: MenuViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)

    }
}
