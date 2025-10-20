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