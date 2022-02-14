//
//  CirclePair.swift
//  Breath
//
//  Created by Henri on 14.2.2022.
//

import SwiftUI

struct CirclePair: View {
    let gradientTop = LinearGradient(
        gradient: Gradient(colors:[.green, .white]), startPoint: .top, endPoint: .bottom)
    let gradientBottom = LinearGradient(
        gradient: Gradient(colors:[.green, .white]), startPoint: .bottom, endPoint: .top)
    
    var body: some View {
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
        .opacity(0.5)
    }
}

struct CirclePair_Previews: PreviewProvider {
    static var previews: some View {
        CirclePair()
    }
}
