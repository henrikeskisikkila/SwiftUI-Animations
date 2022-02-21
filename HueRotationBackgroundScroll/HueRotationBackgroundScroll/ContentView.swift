//
//  ContentView.swift
//  HueRotationBackgroundScroll
//
//  Created by Henri on 18.2.2022.
//

import SwiftUI

struct ContentView: View {
    var backgrounds = ["img1", "img2", "img3", "img4", "img5", "img6", "img7", "img8", "img9", "img10", "img11", "img12", "img13"].shuffled()
    @State private var hueRotation = false
    
    var body: some View {
        GeometryReader { reader in
            BackgroundScroll(imageCount: backgrounds.count) {
                ForEach (0 ..< backgrounds.count) { index in
                    Image(backgrounds[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: reader.size.width, height: reader.size.height)
                        .clipped()
                }
            }
            .hueRotation(.degrees(hueRotation ? 10 : 500))
            .animation(.easeInOut(duration: 5).repeatForever(autoreverses: true), value: hueRotation)
            .onAppear {
                hueRotation.toggle()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
