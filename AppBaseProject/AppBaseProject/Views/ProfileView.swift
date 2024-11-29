//
//  ProfileView.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import SwiftUI

class ProfileViewConfigurator {
    @ViewBuilder
    func setup(coordinator: CoordinatorProtocol) -> some View {
        let viewModel = ProfileViewModel(coordinator: coordinator)
        ProfileView(viewModel: viewModel)
    }
}

class ProfileViewModel: ObservableObject {
    var coordinator: CoordinatorProtocol
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var email: String = ""
    @Published var country: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
}

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
