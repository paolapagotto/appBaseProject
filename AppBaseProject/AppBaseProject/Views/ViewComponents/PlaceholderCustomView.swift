//
//  PlaceholderCustomView.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 30/11/2024.
//

import SwiftUI

struct PlaceHolderCustomView: View {
    @State var animate: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 32)
                .scaleEffect(animate ? 1.1 : 1.0)
                .padding(16)
            
            ForEach(0..<3) { _ in
                HStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 50, height: 50)
                        .scaleEffect(animate ? 1.1 : 1.0)
                    VStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 20)
                            .scaleEffect(animate ? 1.1 : 1.0)
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 20)
                            .padding(.top, 5)
                            .scaleEffect(animate ? 1.1 : 1.0)
                    }
                    .padding([.leading, .trailing], 16)
                }
            }
        }
        .padding(16)
        .padding(.bottom, 16)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                animate.toggle()
            }
        }
    }
}
