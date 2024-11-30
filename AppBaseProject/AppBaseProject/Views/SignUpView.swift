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
    @Published var user: User?
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var email: String = ""
    @Published var country: String = ""
    @Published var city: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var enableButton: Bool = false
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func navigateTo(_ route: Route) {
        coordinator.push(next: route)
    }
    
    func popBack() {
        coordinator.popBack()
    }
    
    func validData() -> Bool {
        return /*!name.isEmpty &&*/ !email.isEmpty /*&& !city.isEmpty && !password.isEmpty && !confirmPassword.isEmpty*/
    }
    func registerUser() {
        self.user = User(name: name, email: email, city: city, password: password)
    }
}

struct SignUpView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    @StateObject var viewModel: SignUpViewModel
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                
                Text("Register new account")
                    .padding([.top, .bottom], 36)
                
                if !viewModel.name.isEmpty {
                    Text("Name")
                        .font(.caption)
                        .tint(Color.gray)
                        .foregroundColor(Color.gray)
                        .frame(alignment: .leading)
                }
                
                TextField("Name", text: $viewModel.name)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
              
                
                Divider()
                    .padding(.bottom, 20)
                
                
                if !viewModel.email.isEmpty {
                    Text("E-mail")
                        .font(.caption)
                        .tint(Color.gray)
                        .foregroundColor(Color.gray)
                        .frame(alignment: .leading)
                }
                TextField("Email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                
                
                Divider()
                    .padding(.bottom, 20)
                
                if !viewModel.city.isEmpty {
                    Text("City")
                        .font(.caption)
                        .tint(Color.gray)
                        .foregroundColor(Color.gray)
                        .frame(alignment: .leading)
                }
                TextField("City", text: $viewModel.city)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                    
                
                Divider()
                    .padding(.bottom, 20)
                
                if !viewModel.password.isEmpty {
                    Text("Password")
                        .font(.caption)
                        .tint(Color.gray)
                        .foregroundColor(Color.gray)
                        .frame(alignment: .leading)
                }
                SecureField("Password", text: $viewModel.password)
                   
                
                Divider()
                    .padding(.bottom, 20)
                
                if !viewModel.confirmPassword.isEmpty {
                    Text("Confirm passwor")
                        .font(.caption)
                        .tint(Color.gray)
                        .foregroundColor(Color.gray)
                        .frame(alignment: .leading)
                }
                SecureField("Confirm Password", text: $viewModel.confirmPassword)
                
                Divider()
                    .padding(.bottom, 20)
            }
            .padding([.leading, .trailing], 32)
            
            Spacer()
            
            Button {
                withAnimation(.spring()) {
                    //viewModel.handleResgitration()
                }
            } label: {
                Text("Register")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .foregroundColor(Color.white)
                    .background(viewModel.email.isEmpty ? Color.gray : Color.black)
                    .cornerRadius(8)
            }
            .disabled(viewModel.email.isEmpty)
        }
        .padding(16)
        .padding(.bottom, 16)
        .navigationTitle("Register")
        .navigationBarTitleDisplayMode(.large)
    }
}
