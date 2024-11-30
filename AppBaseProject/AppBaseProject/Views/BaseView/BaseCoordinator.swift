//
//  BaseCoordinator.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import Foundation
import SwiftUI

class BaseCoordinator: CoordinatorProtocol, ObservableObject {
    
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheetPath: NavigationPath = NavigationPath()
    @Published var coverPath: NavigationPath = NavigationPath()
    @Published var alertPath: AlertPath = AlertPath()
    @Published var isPresentingCover: Bool = false
    @Published var isPresentingSheet: Bool = false
    @Published var appRoot: AppRoot = .initial
    
    var modalSheetRoot: Route = .empty
    var modalCoverRoot: Route = .empty
    
    @ViewBuilder
    func initial(root: AppRoot) -> some View {
        switch root {
        case .initial:
            resolveView(for: .main)
        case .login:
            resolveView(for: .signIn)
        case .tabBar:
            resolveView(for: .home)
        }
    }
    
    @ViewBuilder
    func resolveView(for route: Route) -> some View {
        switch route {
        case .main:
            MainViewConfigurator().setup(coordinator: self)
        case .signIn:
            SignInViewConfigurator().setup(coordinator: self)
        case .signUp:
            SignUpViewConfigurator().setup(coordinator: self)
        case .recoverPassword:
            RecoverViewConfigurator().setup(coordinator: self)
        case .profile:
            ProfileViewConfigurator().setup(coordinator: self)
        default:
            EmptyView()
        }
    }
    
    func push(next screenRoute: Route) {
        if isPresentingSheet {
            sheetPath.append(screenRoute)
        } else if isPresentingCover {
            coverPath.append(screenRoute)
        } else {
            path.append(screenRoute)
        }
    }
    
    func push(routes: [Route]) {
        if isPresentingSheet {
            sheetPath.append(routes)
        } else if isPresentingCover {
            coverPath.append(routes)
        } else {
            path.append(routes)
        }
    }
    
    func presentSheet(sheet: Route) {
        self.isPresentingSheet = true
        self.modalSheetRoot = sheet
    }
    
    func presentFullScreenCover(cover: Route) {
        self.isPresentingCover = true
        self.modalCoverRoot = cover
    }
    
    func popBack() {
        if isPresentingSheet {
            sheetPath.removeLast()
        } else if isPresentingCover {
            coverPath.removeLast()
        } else {
            path.removeLast()
        }
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.isPresentingSheet = false
        self.sheetPath.removeLast(sheetPath.count)
    }
    
    func dismissFullScreenCover() {
        self.isPresentingCover = false
        self.coverPath.removeLast(coverPath.count)
    }
    
    func presentAlert<T>(_ alert: T) where T: AlertDisplayableProtocol {
        alertPath.setAlert(alert)
    }
    
}
