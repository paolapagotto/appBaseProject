//
//  ListView.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import SwiftUI

class ListViewConfigurator {
    @ViewBuilder
    func setup(coordinator: ListCoordinator) -> some View {
        let viewModel = ListViewModel()
        ListView(coordinator: coordinator, viewModel: viewModel)
    }
}

class ListViewModel: ObservableObject {
}

struct ListView: View {
    @StateObject var coordinator: ListCoordinator
    @StateObject var viewModel: ListViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)

    }
}
