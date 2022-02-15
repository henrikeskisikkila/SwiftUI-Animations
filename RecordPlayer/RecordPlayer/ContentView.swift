//
//  ContentView.swift
//  RecordPlayer
//
//  Created by Henri on 14.2.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying = false
    @State private var rotateArm = false
    @State private var degrees = 0.0
    let audioPlayer = AudioPlayer()
    
    var body: some View {
        VStack {
            ZStack {
                RecordPlayerBox()
                RecordView(degrees: $degrees, shouldAnimate: $isPlaying)
                ArmView(rotateArm: $rotateArm)
            }
            
            Button(action: {
                isPlaying.toggle()
                if isPlaying {
                    degrees = 3600
                    rotateArm.toggle()
                    audioPlayer.play()
                } else {
                    rotateArm.toggle()
                    degrees = 0
                    audioPlayer.stop()
                }
            }) {
                let label = isPlaying ? ("Stop", "stop") : ("Play", "play")
                withAnimation {
                    Label(label.0, systemImage: label.1)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
