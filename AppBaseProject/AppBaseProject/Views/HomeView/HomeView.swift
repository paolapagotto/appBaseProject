//
//  HomeView.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import SwiftUI

class HomeViewConfigurator {
    @ViewBuilder
    func setup(coordinator: HomeCoordinator) -> some View {
        let viewModel = HomeViewModel()
        HomeView(coordinator: coordinator, viewModel: viewModel)
    }
}

class HomeViewModel: ObservableObject {
    @Published var animate: Bool = false
    @Published var data: [ImageName] = [.dino1, .dino2, .dino3, .dino4, .dino5, .dino6, .dino7]
}

struct HomeView: View {
    @StateObject var coordinator: HomeCoordinator
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        NavigationStack(path: /*$viewModel.*/$coordinator.path) {
            ZStack {
                Color.black
                    .ignoresSafeArea(.all)
                
                VStack(spacing: 0) {
                    HStack {
                        Text("Hello, User")
                        Spacer()
                        
                        Button {
                            /*viewModel.*/coordinator.push(next: .profile)
                        } label: {
                            Image(systemName: "person.circle.fill")
                                .foregroundStyle(.tint)
                                .imageScale(.large)
                        }
                        
                    }
                    .padding([.leading, .trailing], 16)
                    .background(Color.white)
                    
                    Spacer()
                    
                    CarouselView(data: viewModel.data)
                        .padding(.bottom, 16)
                        .onTapGesture(perform: {
                            ///*viewModel.*/coordinator.presentSheet(sheet: .homeChild)
                        })
                    
                    VStack {
                        PlaceHolderCustomView()
                    }
                    .background(Color.white)
                    .cornerRadius(24, corners: [.topLeft, .topRight])
                
                }
            }
            .background(Color.black)
            .navigationDestination(for: Route.self, destination: { route in
                /*viewModel.*/coordinator.resolveView(for: route)
            })
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $coordinator.isPresentingSheet) {
            NavigationStack(path: $coordinator.sheetPath) {
                coordinator.resolveView(for: coordinator.modalSheetRoot)
                    .navigationDestination(for: Route.self) { route in
                        coordinator.resolveView(for: route)
                }
            }
        }
        .fullScreenCover(isPresented: $coordinator.isPresentingCover) {
            NavigationStack(path: $coordinator.coverPath) {
                coordinator.resolveView(for: coordinator.modalCoverRoot)
                    .navigationDestination(for: Route.self) { route in
                        coordinator.resolveView(for: route)
                }
            }
        }
        .alert(for: $coordinator.alertPath)

    }
}
