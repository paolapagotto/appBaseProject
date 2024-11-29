//
//  SignInView.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import SwiftUI

class SignInViewConfigurator {
    @ViewBuilder
    func setup(coordinator: CoordinatorProtocol) -> some View {
        let viewModel = SignInViewModel(coordinator: coordinator)
        SignInView(viewModel: viewModel)
    }
}

class SignInViewModel: ObservableObject {
    var coordinator: CoordinatorProtocol
    @Published var userName: String = ""
    @Published var password: String = ""
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
}

struct SignInView: View {
    @StateObject var viewModel: SignInViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//#Preview {
//    SignInView(viewModel: SignInViewModel(coordinator: BaseCoordinator()))
//}
