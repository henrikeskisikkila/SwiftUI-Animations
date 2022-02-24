//
//  ContentView.swift
//  PresentDismissAnimation
//
//  Created by Henri on 23.2.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SettingView()
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
        <#code#>
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
