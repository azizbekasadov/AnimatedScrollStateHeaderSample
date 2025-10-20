//
//  ContentView.swift
//  AnimatedScrollStateHeaderSample
//
//  Created by Azizbek Asadov on 21.10.2025.
//

import SwiftUI
import Algorithms
struct ContentView: View {
    private static let kScrollContentCoordinateSpace = "scrollContent"
    @State private var targetPosition: CGFloat = 0.0
    
    private var scrollCoordinateSpace = NamedCoordinateSpace.named(ContentView.kScrollContentCoordinateSpace)
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    if index % 5 == 0 {
                        Color.red
                            .frame(height: 50)
                            .monitorViewScrollOffset(
                                in: scrollCoordinateSpace,
                                edge: .bottom) { offset in
                                    targetPosition = offset
                                }
                    } else {
                        Color.blue.opacity(0.3)
                            .frame(height: 50)
                    }
                }
            }
        }
        .onPreferenceChange(ASViewOffsetKey.self, perform: { value in
            targetPosition = value
        })
        .overlay(alignment: .topLeading) {
            Text(String(format: "Target position: %.2f", targetPosition))
                .monospacedDigit()
                .padding()
                .background(.white)
            
        }
        .overlay(alignment: .bottom) {
            ExtraContent()
                .opacity(extraContentOpacity(targetPosition))
                .offset(x: 0, y: extraContentOffset(targetPosition))
        }
    }
    
    private var extraContentOpacity = LinearAlgebra.LinearEquation.segmented(
        from: CGPoint(x: -20, y: 1.0),
        to: CGPoint.zero
    )
    
    private var extraContentOffset = LinearAlgebra.LinearEquation.segmented(
        from: CGPoint(x: -20, y: 0),
        to: CGPoint(x: 0, y: 100)
    )
    
    @ViewBuilder
    private func ExtraContent() -> some View {
        Text("Tracked Content on Screen!")
            .font(.headline)
            .bold()
            .padding(20)
            .background(
                Color.yellow
            )
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
