//
//  SettingView.swift
//  PresentDismissAnimation
//
//  Created by Henri on 23.2.2022.
//

import SwiftUI

struct SettingView: View {
    @State private var setDate = Date()
    @State private var timezone = false
    @State private var volume = 50.0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.red.ignoresSafeArea()
                List {
                    Section(header: Text("Date and Time")) {
                        DatePicker(selection: $setDate, label: {
                            Image(systemName: "calendar.circle")
                        })
                    }
                    Section(header: Text("Time Zone")) {
                        Toggle(isOn: $timezone, label: {
                            HStack {
                                Image(systemName: "timer")
                                Text("Timezone")
                            }
                        })
                    }
                    Section(header: Text("Alarm Volume")) {
                        Text("Volume \(String(format: "%.0f", volume as Double))")
                        Slider(value: $volume, in: 0...100) { _ in }
                    }
                }
            }
        }
        .frame(width: 400, height: 625)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
