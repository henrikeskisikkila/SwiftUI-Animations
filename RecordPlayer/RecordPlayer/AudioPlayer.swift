//
//  AudioPlayer.swift
//  RecordPlayer
//
//  Created by Henri on 15.2.2022.
//

import Foundation
import AVFAudio

class AudioPlayer {
    var audioPlayer: AVAudioPlayer?
    let file = "music"
    let type = "m4a"
    
    func play() {
        guard let path = Bundle.main.path(forResource: file, ofType: type) else {
            print("Could not find music file")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file")
        }
        
    }
    
    func stop() {
        audioPlayer?.stop()
    }
}
