//
//  RecordPlayerBox.swift
//  RecordPlayer
//
//  Created by Henri on 14.2.2022.
//

import SwiftUI

struct RecordPlayerBox: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 345, height: 345)
                .cornerRadius(10)
            Image("woodGrain")
                .resizable()
                .frame(width: 325, height: 325)
                .shadow(color: Color(UIColor.systemBackground), radius: 3)
        }
    }
}

struct RecordPlayerBox_Previews: PreviewProvider {
    static var previews: some View {
        RecordPlayerBox()
    }
}
