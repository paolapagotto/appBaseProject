//
//  HomeView.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import SwiftUI

class HomeViewConfigurator {
    @ViewBuilder
    func setup(coordinator: HomeCoordinator) -> some View {
        let viewModel = HomeViewModel()
        HomeView(coordinator: coordinator, viewModel: viewModel)
    }
}

class HomeViewModel: ObservableObject {
    @Published var animate: Bool = false
}

struct HomeView: View {
    @StateObject var coordinator: HomeCoordinator
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)

    }
}
