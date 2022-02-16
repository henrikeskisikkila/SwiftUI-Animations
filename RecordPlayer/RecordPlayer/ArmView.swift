//
//  ArmView.swift
//  RecordPlayer
//
//  Created by Henri on 15.2.2022.
//

import SwiftUI

struct ArmView: View {
    @Binding var rotateArm: Bool
    
    var body: some View {
        Image("playerArm").resizable().aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .shadow(color: .gray, radius: 2, x: 0, y: 0)
            .rotationEffect(Angle.degrees(-35), anchor: .topTrailing)
            .rotationEffect(Angle.degrees(rotateArm ? 12 : 0), anchor: .topTrailing)
            .animation(Animation.linear(duration: 2),value: rotateArm)
            .offset(x: 70, y: -20)
    }
}

struct ArmView_Previews: PreviewProvider {
    static var previews: some View {
        ArmView(rotateArm: .constant(true))
    }
}