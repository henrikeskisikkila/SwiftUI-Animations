//
//  ContentView.swift
//  ImageAppearAnimation
//
//  Created by Henri on 17.2.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    private var audioPlayer = AudioPlayer()
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Summer")
                .font(.custom("Fasthand-Regular", size: 64))
                .opacity(animate ? 1 : 0)
                .animation(.easeIn(duration: 0.1), value: animate)
            Image("sailing")
                .resizable()
                .scaledToFill()
                .frame(width: 316, height: 200)
                .clipped()
                .opacity(animate ? 1 : 0)
                .animation(.easeIn(duration: 0.5), value: animate)
            HStack (spacing: 8){
                Image("hat-woman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
                    .opacity(animate ? 1 : 0)
                    .animation(.easeIn(duration: 0.5).delay(0.5), value: animate)
                Image("reading")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
                    .opacity(animate ? 1 : 0)
                    .animation(.easeIn(duration: 0.5).delay(1.0), value: animate)
                Image("sunbeds")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
                    .opacity(animate ? 1 : 0)
                    .animation(.easeIn(duration: 0.5).delay(1.5), value: animate)
            }
            Button(action: {
                audioPlayer.stop()
                animate.toggle()
                if animate {
                    audioPlayer.play()
                }
            }) {
                Text("Run")
            }
            .padding(50)
        }
        .onAppear {
            animate.toggle()
            audioPlayer.play()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
