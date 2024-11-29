//
//  AppBaseProjectApp.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import SwiftUI
import SwiftData

@main
struct AppBaseProjectApp: App {
    @StateObject var baseCoordinator = BaseCoordinator()
    @StateObject var tabBarCoordinator = TabBarCoordinator()
    
    @StateObject private var appRootManager = AppRootManager()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            VStack {
                if appRootManager.currentRoot == .tabBar {
                    TabBarViewConfigurator().setup(coordinator: tabBarCoordinator)
                } else {
                    BaseViewConfigurator().setup(coordinator: baseCoordinator)
                }
            }
            .environmentObject(appRootManager)
        }
        .modelContainer(sharedModelContainer)
    }
}
