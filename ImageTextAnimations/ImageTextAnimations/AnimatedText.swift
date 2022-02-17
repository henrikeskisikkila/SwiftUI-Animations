//
//  AnimatedText.swift
//  ImageTextAnimations
//
//  Created by Henri on 17.2.2022.
//

import SwiftUI

struct AnimatedText: View {
    let text: String
    let size: CGFloat
    var body: some View {
        Text(text)
            .font(.system(size: size))
            
    }
}

struct AnimatedText_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedText(text: "", size: 24.0)
    }
}
