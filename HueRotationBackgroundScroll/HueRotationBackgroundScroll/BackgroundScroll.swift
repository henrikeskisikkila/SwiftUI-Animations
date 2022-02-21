//
//  BackgroundScroll.swift
//  HueRotationBackgroundScroll
//
//  Created by Henri on 18.2.2022.
//

import SwiftUI

struct BackgroundScroll<ViewContent: View>: View {
    private var imageCount: Int
    private var contentContainer: ViewContent
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State private var workingIndex: Int = 0
    
    init(imageCount: Int, @ViewBuilder content: () -> ViewContent) {
        self.imageCount = imageCount
        self.contentContainer = content()
    }
    
    var body: some View {
        GeometryReader { reader in
            ZStack(alignment: .bottom) {
                HStack(spacing: 0) {
                    contentContainer
                }
                .frame(width: reader.size.width, height: reader.size.height)
                .offset(x: CGFloat(self.workingIndex) * -reader.size.width, y: 0)
                .animation(.easeInOut, value: workingIndex)
                // Paging dots
                HStack(spacing: 7) {
                    ForEach(0..<imageCount) { index in
                        Circle()
                            .frame(width: index == workingIndex ? 13 : 9, height: index == workingIndex ? 13 : 9)
                            .foregroundColor(index == workingIndex ? .white : .gray)
                            .overlay(Circle().stroke(.black, lineWidth: 1))
                            .padding(.bottom, 20)
                            .animation(.easeInOut, value: workingIndex)
                    }
                }
            }
            .onReceive(timer, perform: { _ in
                workingIndex = (workingIndex + 1) % (imageCount == 0 ? 1 : imageCount)
            })

        }
    }
}
