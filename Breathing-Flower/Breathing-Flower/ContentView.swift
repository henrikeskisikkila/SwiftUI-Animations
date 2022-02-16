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
                Group {
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
                .offset(y: -160)

                
                VStack {
                    ZStack {
                        Image("breath")
                            .resizable()
                            .frame(width: 35, height: 125)
                            .offset(y: breath ? 0 : 90)
                            .blur(radius: breath ? 60 : 1)
                            
                            .animation(.timingCurve(0.65, -2.6, 0.32, 0.4)
                                        .delay(0.05)
                                        .speed(0.1)
                                        .repeatForever(autoreverses: true), value: breath)
                        // Left petal
                        Petal(petal: $breath, degrees:  breath ? -5 : -25)
                        
                        // Middle petal
                        Image("flower").resizable().frame(width: 75, height: 125)
                        
                        // Right petal
                        Petal(petal: $breath, degrees: breath ? 5 : 25)
                        
                        // Far left petal
                        Petal(petal: $breath, degrees: breath ? -10 : -50)
                        
                        // Far right petal
                        Petal(petal: $breath, degrees: breath ? 10 : 50)

                    }
                }
            }
            .shadow(radius: breath ? 0 : 20)
            .hueRotation(Angle(degrees: breath ? 180 : 0))
        }
        .animation(.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breath)
        .onAppear {
            breath.toggle()
        }
    }
}

struct Petal: View {
    @Binding var petal: Bool
    var degrees: Double = 0.0
    
    var body: some View {
        Image("flower")
            .resizable()
            .frame(width: 75, height: 125)
            .rotationEffect(.degrees(petal ? degrees : degrees), anchor: .bottom)
            .animation(.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: degrees)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
