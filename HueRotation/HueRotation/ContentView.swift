//
//  ContentView.swift
//  HueRotation
//
//  Created by Henri on 15.2.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var image = "dog"
    @State private var shiftColors = false
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 350, height: 350)
                .padding(20)
                .hueRotation(.degrees(shiftColors ? 360 * 2 : 0))
                .animation(
                    .easeInOut(duration: 2)
                        .delay(0.4)
                        .speed(0.2)
                        .repeatForever(autoreverses: true), value: shiftColors)
                .onAppear() {
                    shiftColors.toggle()
                }
            ImagePicker(image: $image)
        }
    }
}

struct ImagePicker: View {
    @Binding var image: String
    let images = ["ornament", "landscape", "dog", "dice", "cat"]
    
    var body: some View {
        Picker("Picker", selection: $image) {
            ForEach(images, id: \.self) { value in
                Text(value)
            }
        }
        .pickerStyle(.wheel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
