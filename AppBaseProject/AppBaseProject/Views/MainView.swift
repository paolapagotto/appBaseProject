//
//  MainView.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import SwiftUI

class MainViewConfigurator {
    @ViewBuilder
    func setup(coordinator: CoordinatorProtocol) -> some View {
        let viewModel = MainViewModel(coordinator: coordinator)
        MainView(viewModel: viewModel)
    }
}

class MainViewModel: ObservableObject {
    var coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
}

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
