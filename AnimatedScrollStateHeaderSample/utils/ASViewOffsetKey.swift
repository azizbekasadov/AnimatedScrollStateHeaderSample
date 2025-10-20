

struct ASViewOffsetKey: PreferenceKey {
    
    static let defaultValue: CGFloat = 0
    
    
    static func reduce(
        value: inout CGFloat,
        nextValue: () -> CGFloat
    ) {
        value = nextValue()
    }
}
