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
    @Published var rotationAngle: Double = 0
    @Published var showLoginImage: Bool = false
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func login() {
        // validate login
        self.navigateTo(.home)
    }
    
    func navigateTo(_ route: Route) {
        coordinator.push(next: route)
    }
    
    func navigateToRoot() {
        coordinator.popToRoot()
    }
    
    func presentSheet(_ sheet: Route) {
        coordinator.presentSheet(sheet: sheet)
    }
}

struct SignInView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    @StateObject var viewModel: SignInViewModel
    
    var body: some View {
        VStack {
            Text("Tamagotchi")
                .font(.system(size: 24, weight: .bold, design: .default))
                .foregroundColor(Color.black)
            
            Spacer()
            
            Image(name: ImageName.tamagotchiLogin)
                .resizable()
                .scaledToFit()
                .frame(width: 180)
                .animation(.easeInOut(duration: 4).speed(0.1), value: viewModel.showLoginImage)
                .rotationEffect(Angle(degrees: viewModel.rotationAngle))
    
            Spacer()
            
            VStack {
                TextField("User", text: $viewModel.userName)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.top, 20)
                    
                
                Divider()
                
                SecureField("Password", text: $viewModel.password)
                    .padding(.top, 20)
                
                Divider()
            }
            .padding([.leading, .trailing], 32)
        
            Spacer()
            
            Button {
                withAnimation(.spring()) {
                    self.viewModel.navigateToRoot()
                    self.appRootManager.currentRoot = .tabBar
                }
            } label: {
                Text("Login")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(8)
            }
            
            HStack {
                Text("Forgot your password?")
                Button {
                    withAnimation(.spring()) {
                        viewModel.presentSheet(.recoverPassword)
                    }
                } label: {
                    Text("Recover now")
                        .foregroundColor(Color.teal)
                        .underline()
                }
            }
            
            
            HStack {
                Text("Don't have an account?")
                Button {
                    withAnimation(.spring()) {
                        viewModel.presentSheet(.signUp)
                    }
                } label: {
                    Text("Register now")
                        .foregroundColor(Color.teal)
                        .underline()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    self.viewModel.showLoginImage = true
                    self.viewModel.rotationAngle += 360
                }
            }
        }
        .padding(16)
        .padding(.bottom, 16)
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.large)
    }
}

