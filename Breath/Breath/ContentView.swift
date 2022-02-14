//
//  ContentView.swift
//  Breath
//
//  Created by Henri on 14.2.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var moveInOut = false
    
    var body: some View {
        let gradient = LinearGradient(
            gradient: Gradient(colors:[.green, .white]), startPoint: .top, endPoint: .bottom)
        ZStack {
            Circle()
                .fill(gradient)
                .frame(width: 120, height: 120)
                .offset(y: moveInOut ? -60 : 0)
            Circle()
                .fill(gradient)
                .frame(width: 120, height: 120)
                .offset(y: moveInOut ? 60 : 0)
        }
        .opacity(0.5)
        .onAppear {
            moveInOut.toggle()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
