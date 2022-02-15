//
//  ContentView.swift
//  RecordPlayer
//
//  Created by Henri on 14.2.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldAnimate = false
    @State private var degrees = 0.0
    
    var body: some View {
        ZStack {
            RecordPlayerBox()
            RecordView(degrees: $degrees, shouldAnimate: $shouldAnimate)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
