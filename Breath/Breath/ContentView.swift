//
//  ContentView.swift
//  Breath
//
//  Created by Henri on 14.2.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var moveInOut = false
    @State private var scaleInOut = false
    @State private var rotateInOut = false
    
    var body: some View {
        let gradientTop = LinearGradient(
            gradient: Gradient(colors:[.green, .white]), startPoint: .top, endPoint: .bottom)
        let gradientBottom = LinearGradient(
            gradient: Gradient(colors:[.green, .white]), startPoint: .bottom, endPoint: .top)
        
        ZStack {
            //MARK: - Set 1
            ZStack {
                Circle()
                    .fill(gradientTop)
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? -60 : 0)
                Circle()
                    .fill(gradientBottom)
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? 60 : 0)
            }
            
            //MARK: - Set 2
            ZStack {
                Circle()
                    .fill(gradientTop)
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? -60 : 0)
                Circle()
                    .fill(gradientBottom)
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? 60 : 0)
            }
            .rotationEffect(.degrees(60))
            
            //MARK: - Set 3
            ZStack {
                Circle()
                    .fill(gradientTop)
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? -60 : 0)
                Circle()
                    .fill(gradientBottom)
                    .frame(width: 120, height: 120)
                    .offset(y: moveInOut ? 60 : 0)
            }
            .rotationEffect(.degrees(120))
        }
        .opacity(0.5)
        .rotationEffect(.degrees(rotateInOut ? 90 : 0))
        .scaleEffect(scaleInOut ? 1 : 1/4)
        .animation(.easeInOut.repeatForever(autoreverses: true).speed(1/8), value: moveInOut)
        .onAppear {
            moveInOut.toggle()
            scaleInOut.toggle()
            rotateInOut.toggle()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
