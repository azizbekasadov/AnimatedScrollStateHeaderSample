//
//  ASViewOffsetKey.swift
//  AnimatedScrollStateHeaderSample
//
//  Created by Azizbek Asadov on 21.10.2025.
//

import SwiftUI

struct ASViewOffsetKey: PreferenceKey {
    
    static let defaultValue: CGFloat = 0
    
    
    static func reduce(
        value: inout CGFloat,
        nextValue: () -> CGFloat
    ) {
        value = nextValue()
    }
}
