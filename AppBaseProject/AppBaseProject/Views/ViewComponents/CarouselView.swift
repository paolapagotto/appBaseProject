//
//  CarouselView.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 30/11/2024.
//

import SwiftUI

struct CarouselView: View {
    var showDots: Bool = false
    var data: [ImageName]
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    // Step 3: Manage Selected Image Index
    @State private var selectedDataIndex: Int = 0

    var body: some View {
        ZStack {
            
            Color.black
            
            TabView(selection: $selectedDataIndex) {
                //Iterate Through Images
                ForEach(0..<data.count, id: \.self) { index in
                    ZStack(alignment: .topLeading) {
                        //Display Image / Data
                        Image(name: data[index])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(index)
                            .frame(width: 360, height: 200)
                            .blendMode(.difference)
                    }
                    //background(VisualEffectBlur())
                    .shadow(radius: 20)
                }
            }
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            HStack {
                Text("tamagotchi highlights")
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .bold()
                    .offset(y: -120)
                    .frame(alignment: .leading)
                Spacer()
            }.padding(16)
            
            //Navigation Dots
            if showDots {
                HStack(spacing: 4) {
                    ForEach(0..<data.count, id: \.self) { index in
                        Capsule()
                            .fill(Color.white.opacity(selectedDataIndex == index ? 1 : 0.33))
                            .frame(width: 16, height: 8)
                            .onTapGesture {
                                selectedDataIndex = index
                            }
                    }
                    .offset(y: 130)
                }
            }
        }
        .compositingGroup()
        .onReceive(timer) { _ in
            //Auto-Scrolling Logic
            withAnimation(.default) {
                selectedDataIndex = (selectedDataIndex + 1) % data.count
            }
        }
    }
}
