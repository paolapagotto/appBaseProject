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
    
    @Published var showUpdateButton: Bool = false
    @Published var showConfirmPassword: Bool = false
    
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var email: String = ""
    @Published var city: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var userDetails: User = User(
        name: "User Name",
        email: "user@email.com",
        city: "Lisbon",
        password: "123456"
    )
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        self.setInitialData()
    }
    
    func setInitialData() {
        name = userDetails.name
        email = userDetails.email
        city = userDetails.city
        password = userDetails.password
    }
    
    func updateData() {
        userDetails = User(name: name, email: email, city: city, password: password)
    }
    
    func shouldShowUpdateButton() {
        showUpdateButton = name != userDetails.name || email != userDetails.email || city != userDetails.city || password != userDetails.password
    }
    
    func navigateTo(_ route: Route) {
        coordinator.push(next: route)
    }
    
    func navigateToRoot() {
        coordinator.popToRoot()
        //coordinator.currentTab = .home
    }
}

struct ProfileView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Profile view")
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 64, height: 64)
                .tint(Color.gray)
                .opacity(0.6)
            
            VStack(alignment: .leading) {
                if !viewModel.name.isEmpty {
                    Text("Name")
                        .font(.caption)
                        .tint(Color.gray)
                        .foregroundColor(Color.gray)
                        .frame(alignment: .leading)
                }
                
                TextField("Name", text: $viewModel.name)
                    .autocapitalization(.none)
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
                
                TextField("E-mail", text: $viewModel.email)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .keyboardType(.emailAddress)
                
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
                    .autocapitalization(.none)
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
                
                if viewModel.showConfirmPassword {
                    if !viewModel.confirmPassword.isEmpty {
                        Text("Confirm password")
                            .font(.caption)
                            .tint(Color.gray)
                            .foregroundColor(Color.gray)
                            .frame(alignment: .leading)
                    }
                    
                    SecureField("Repeat password", text: $viewModel.confirmPassword)
                }
            }
            .padding([.leading, .trailing], 32)
            
            
            Spacer()
            
            Button {
                withAnimation(.spring()) {
                    viewModel.updateData()
                    //viewModel.navigateToRoot()
                    viewModel.coordinator.presentAlert(AlertDisplayable(title: "Success", message: "Changes have been saved successfully", buttons: [AlertButton]()))
                }
            } label: {
                Text("Save profile changes")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .foregroundColor(Color.white)
                    .background(viewModel.showUpdateButton ? Color.gray : Color.black)
                    .cornerRadius(8)
            }
            .frame(height: 48)
            .padding([.leading, .trailing], 16)
            
            Button {
                withAnimation(.spring()) {
                    viewModel.navigateToRoot()
                    appRootManager.currentRoot = .login
                }
            } label: {
                Text("Log out")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .foregroundColor(Color.white)
                    .background(viewModel.showUpdateButton ? Color.gray : Color.black)
                    .cornerRadius(8)
            }
            .frame(height: 48)
            .padding([.leading, .trailing, .bottom], 16)
        }
        .padding(.top, 32)
        .onAppear {
            viewModel.setInitialData()
        }
    }
}
