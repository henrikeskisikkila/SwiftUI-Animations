//
//  ContentView.swift
//  Breathing-Flower
//
//  Created by Henri on 15.2.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var breath = true
    
    var body: some View {
        ZStack {
            ZStack {
                Text("Breath In")
                    .font(.custom("papyrus", size: 35))
                    .foregroundColor(.green)
                    .opacity(breath ? 0 : 1)
                    .scaleEffect(breath ? 0 : 1)
                    
                Text("Breath Out")
                    .font(.custom("papyrus", size: 35))
                    .foregroundColor(.orange)
                    .opacity(breath ? 1 : 0)
                    .scaleEffect(breath ? 1 : 0)
            }
        }
        .animation(.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breath)
        .onAppear {
            breath.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
