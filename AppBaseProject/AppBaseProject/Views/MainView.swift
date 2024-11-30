//
//  MainView.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import SwiftUI

class MainViewConfigurator {
    @ViewBuilder
    func setup(coordinator: CoordinatorProtocol) -> some View {
        let viewModel = MainViewModel(coordinator: coordinator)
        MainView(viewModel: viewModel)
    }
}

class MainViewModel: ObservableObject {
    @Published var coordinator: CoordinatorProtocol
    @Published var showSplash: Bool = false
    @Published var animate: Bool = false
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func navigateTo(_ route: Route) {
        coordinator.push(next: route)
    }
    
    func presentSheet(_ sheet: Route) {
        coordinator.presentSheet(sheet: sheet)
    }
}

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            Color.teal.opacity(0.5)
                .ignoresSafeArea(.all)
        
            
            Image(name: ImageName.tamagotchi)
                .resizable()
                .scaledToFit()
                .frame(width: 320)
                .opacity(0.8)
                .shadow(color: .gray, radius: 8)
            
            Image(name: ImageName.tamagotchiInner)
                .resizable()
                .scaledToFit()
                .frame(width: 72, height: 48)
                .scaleEffect(viewModel.animate ? 1.2 : 1.0)
                .offset(y: 24)
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: viewModel.animate)
            
            VStack {
                Image(name: ImageName.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280)
                    .shadow(color: .gray, radius: 8)
                    .padding(.top, 32)
                    .blendMode(.hue)
                
                Spacer()
                Text("Welcome")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .bold()
                
                Button {
                    viewModel.navigateTo(.signIn)
                } label: {
                    Text("Sign In")
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, maxHeight: 48)
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .cornerRadius(8)
                }
                
                HStack {
                    Text("Don't have an account?")
                    Button {
                        viewModel.presentSheet(.signUp)
                    } label: {
                        Text("Sign up now")
                            .foregroundColor(Color.black)
                            .bold()
                            .underline()
                    }
                }
            }
            .padding(16)
            .padding(.bottom, 16)
        }
        .compositingGroup()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    self.viewModel.animate = true
                }
            }
        }
        
    }
}
