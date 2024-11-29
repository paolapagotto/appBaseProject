//
//  RecoverView.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import SwiftUI



class RecoverViewConfigurator {
    @ViewBuilder
    func setup(coordinator: CoordinatorProtocol) -> some View {
        let viewModel = RecoverViewModel(coordinator: coordinator)
        RecoverView(viewModel: viewModel)
    }
}

class RecoverViewModel: ObservableObject {
    var coordinator: CoordinatorProtocol
    @Published var userName: String = ""
    @Published var password: String = ""
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
}

struct RecoverView: View {
    @StateObject var viewModel: RecoverViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
