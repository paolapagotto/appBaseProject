//
//  TabBarView.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import SwiftUI

class TabBarViewConfigurator {
    @ViewBuilder
    func setup(coordinator: TabBarCoordinator) -> some View {
        let viewModel = TabBarViewModel(tabBarCoordinator: coordinator)
        TabBarView(viewModel: viewModel)
    }
}

class TabBarViewModel: ObservableObject {
    @Published var tabBarCoordinator: TabBarCoordinator
    
    init(tabBarCoordinator: TabBarCoordinator) {
        self.tabBarCoordinator = tabBarCoordinator
    }
}

struct TabBarView: View {
    @StateObject var viewModel: TabBarViewModel
    
    var body: some View {
        TabView(selection: $viewModel.tabBarCoordinator.selectedTab) {
            ForEach(self.viewModel.tabBarCoordinator.tabItems, id: \.self) { tabItem in
                viewModel.tabBarCoordinator.initial(root: tabItem)
                    .tabItem { Label(tabItem.title, systemImage: tabItem.systemImageName) }
                    .tag(tabItem)
                    .padding(.bottom, 16)
            }
        }
        .accentColor(.red)
    }
}
