//
//  ContentView.swift
//  PresentDismissAnimation
//
//  Created by Henri on 23.2.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showSetting = false
    
    var body: some View {
        Button(action: { showSetting.toggle() }) {
            
            Label(showSetting ? "Close" : "Set alarm", systemImage: "alarm")
        }
        
        if showSetting {
            SettingView()
        }
    }
}

struct PresentAndDismiss: GeometryEffect {
    var offsetValue: Double
    var animatableData: Double {
        get {
            offsetValue
        }
        set {
            offsetValue = newValue
        }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let rotationOffset = offsetValue
        let angleOfRotation = CGFloat(Angle(degrees: 95 * (1 - rotationOffset)).radians)
        var transform3D = CATransform3DIdentity
        transform3D.m34 = -1 / max(size.width, size.height)
        
        transform3D = CATransform3DRotate(transform3D, angleOfRotation, 1, 0, 0)
        transform3D = CATransform3DTranslate(transform3D, -size.width/2.0, -size.height/2.0, 0)
        
        let transformAffine1 = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height / 2.0))
        let transformAffine2 = ProjectionTransform(CGAffineTransform(scaleX: CGFloat(offsetValue * 2), y: CGFloat(offsetValue * 2)))
        if offsetValue <= 0.5 {
            return ProjectionTransform(transform3D).concatenating(transformAffine2).concatenating(transformAffine1)
        } else {
            return ProjectionTransform(transform3D).concatenating(transformAffine1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
