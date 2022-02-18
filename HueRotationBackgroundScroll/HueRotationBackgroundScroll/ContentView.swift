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
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
