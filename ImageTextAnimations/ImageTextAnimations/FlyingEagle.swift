//
//  FlyingEagle.swift
//  ImageTextAnimations
//
//  Created by Henri on 17.2.2022.
//

import SwiftUI

struct FlyingEagle: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            Image("leftWing")
                .resizable()
                .frame(width: 150, height: 150)
                .offset(x: animate ? -20 : -60, y: animate ? -60 : 0)
                .rotationEffect(.degrees(animate ? -30 : 0), anchor: .bottomTrailing)
            Image("rightWing")
                .resizable()
                .frame(width: 150, height: 150)
                .offset(x: animate ? 20 : 60, y: animate ? -60 : 0)
                .rotationEffect(.degrees(animate ? 30 : 0), anchor: .bottomLeading)
            Image("body")
                .resizable()
                .frame(width: 100, height: 125)
                .offset(y: animate ? 20 : 40)
        }
        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: animate)
        .onAppear {
            animate.toggle()
        }
    }
}

struct FlyingEagle_Previews: PreviewProvider {
    static var previews: some View {
        FlyingEagle()
    }
}
