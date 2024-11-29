//
//  TabBarCoordinator.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import Foundation
import SwiftUI

enum TabBarItem: Int, CaseIterable, Hashable, Identifiable {
    case home
    case list
    case shop
    case menu
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .list: return "List"
        case .shop: return "Shop"
        case .menu: return "Menu"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .home: return "house.circle.fill"
        case .list: return "magnifyingglass.circle.fill"
        case .shop: return "cart.circle.fill"
        case .menu: return "ellipsis.circle.fill"
        }
    }
}

class TabBarCoordinator: ObservableObject {
    @Published var selectedTab: TabBarItem
    @Published var tabItems: [TabBarItem] = TabBarItem.allCases
    @Published var homeCoordinator: HomeCoordinator = HomeCoordinator()
    @Published var listCoordinator: ListCoordinator = ListCoordinator()
    @Published var shopCoordinator: ShopCoordinator = ShopCoordinator()
    @Published var menuCoordinator: MenuCoordinator = MenuCoordinator()
    
    init(selectedTab: TabBarItem = .home) {
        self.selectedTab = selectedTab
    }
    
    @ViewBuilder
    func initial(root: TabBarItem) -> some View {
        switch root {
        case .home:
            HomeViewConfigurator().setup(coordinator: homeCoordinator)
        case .list:
            ListViewConfigurator().setup(coordinator: listCoordinator)
        case .shop:
            ShopViewConfigurator().setup(coordinator: shopCoordinator)
        case .menu:
            MenuViewConfigurator().setup(coordinator: menuCoordinator)
        }
    }
}
