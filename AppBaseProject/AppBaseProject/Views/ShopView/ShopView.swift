//
//  ShopView.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import SwiftUI

class ShopViewConfigurator {
    @ViewBuilder
    func setup(coordinator: ShopCoordinator) -> some View {
        let viewModel = ShopViewModel()
        ShopView(coordinator: coordinator, viewModel: viewModel)
    }
}

class ShopViewModel: ObservableObject {
}

struct ShopView: View {
    @StateObject var coordinator: ShopCoordinator
    @StateObject var viewModel: ShopViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)

    }
}
