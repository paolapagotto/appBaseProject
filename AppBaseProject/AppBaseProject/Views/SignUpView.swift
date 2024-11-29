//
//  SignUpView.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import SwiftUI

class SignUpViewConfigurator {
    @ViewBuilder
    func setup(coordinator: CoordinatorProtocol) -> some View {
        let viewModel = SignUpViewModel(coordinator: coordinator)
        SignUpView(viewModel: viewModel)
    }
}

class SignUpViewModel: ObservableObject {
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

struct SignUpView: View {
    @StateObject var viewModel: SignUpViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
