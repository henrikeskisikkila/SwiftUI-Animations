//
//  ContentView.swift
//  ImageTextAnimations
//
//  Created by Henri on 17.2.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            GeometryReader { reader in
                Image("mountain")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                AnimatedText(text: "Annapurna", size: 48.0)
                    .position(x: reader.size.width / 2, y: reader.size.height / 5)
                    .scaleEffect(animate ? 0.95 : 1)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animate)
                FlyingEagle()
                    .position(x: reader.size.width / 2, y: reader.size.height / 2)
            }
        }
        .onAppear {
            animate.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
