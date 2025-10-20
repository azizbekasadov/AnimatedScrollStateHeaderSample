//
//  ViewEdgeToTrack.swift
//  AnimatedScrollStateHeaderSample
//
//  Created by Azizbek Asadov on 21.10.2025.
//

import SwiftUI

enum ViewEdgeToTrack {
    case top
    case bottom
}

extension View {
    func monitorViewScrollOffset(
        in coordinateSpace: NamedCoordinateSpace,
        edge: ViewEdgeToTrack = .top,
        onChange: @escaping (CGFloat) -> Void
    ) -> some View {
        modifier(
            MonitoringViewScrollOffset(
                coordinateSpace: coordinateSpace,
                edge: edge,
                onChange: onChange
            )
        )
    }
}

private struct MonitoringViewScrollOffset: ViewModifier {
    let coordinateSpace: NamedCoordinateSpace
    let edge: ViewEdgeToTrack
    let onChange: (CGFloat) -> Void

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(
                            key: ASViewOffsetKey.self,
                            value: offset(in: proxy)
                        )
                }
            )
            .onPreferenceChange(ASViewOffsetKey.self, perform: onChange)
    }

    func offset(in geometryProxy: GeometryProxy) -> CGFloat {
        let frame = geometryProxy.frame(in: coordinateSpace)
        return edge == .top ? frame.minY : frame.maxY
    }
}
