//
//  BaseView.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import SwiftUI

class BaseViewConfigurator {
    @ViewBuilder
    func setup(coordinator: BaseCoordinator) -> some View {
        let viewModel = BaseViewModel(coordinator: coordinator)
        BaseView(viewModel: viewModel)
    }
}

class BaseViewModel: ObservableObject {
    @Published var coordinator: BaseCoordinator
    @Published var showSplashView: Bool = false
    
    init(coordinator: BaseCoordinator) {
        self.coordinator = coordinator
    }
}


struct BaseView: View {
    @EnvironmentObject var appRootManager: AppRootManager
    @StateObject var viewModel: BaseViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.coordinator.path) {
            //return view
            viewModel.coordinator.initial(root: viewModel.coordinator.appRoot)
                .navigationDestination(for: Route.self, destination: { route in
                    viewModel.coordinator.resolveView(for: route)
                })
        }
        .sheet(isPresented: $viewModel.coordinator.isPresentingSheet) {
            //return modal view: sheet
            NavigationStack(path: $viewModel.coordinator.sheetPath) {
                viewModel.coordinator.resolveView(for: viewModel.coordinator.modalSheetRoot)
                    .navigationDestination(for: Route.self, destination: { route in
                        viewModel.coordinator.resolveView(for: route)
                    })
            }
        }
        .fullScreenCover(isPresented: $viewModel.coordinator.isPresentingCover) {
            //return modal view: full cover
            NavigationStack(path: $viewModel.coordinator.coverPath) {
                viewModel.coordinator.resolveView(for: viewModel.coordinator.modalCoverRoot)
                    .navigationDestination(for: Route.self , destination: { route in
                        viewModel.coordinator.resolveView(for: route)
                    })
            }
        }
        .onChange(of: viewModel.coordinator.appRoot, {
            viewModel.coordinator.popToRoot()
        })
        .alert(for: $viewModel.coordinator.alertPath)
        .accentColor(.teal)
        .environmentObject(viewModel.coordinator)
    }
}
