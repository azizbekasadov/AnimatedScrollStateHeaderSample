//
//  LinearEquation.swift
//  AnimatedScrollStateHeaderSample
//
//  Created by Azizbek Asadov on 21.10.2025.
//

import CoreGraphics

struct LinearAlgebra {
    enum LinearEquation {
        static func segmented(
            from fromPoint: CGPoint = .zero,
            to toPoint: CGPoint = .zero
        ) -> (CGFloat) -> CGFloat {
            let valueEquation = equation(
                from: fromPoint,
                to: toPoint
            )
            
            let result: (CGFloat)->CGFloat = { offset in
                if offset < fromPoint.x {
                    return fromPoint.y
                } else if offset > toPoint.x {
                    return toPoint.y
                } else {
                    return valueEquation(offset)
                }
            }
            
            return result
        }
        
        static func equation(
            from fromPoint: CGPoint,
            to toPoint: CGPoint
        ) -> (CGFloat) -> CGFloat {
            let pendant: CGFloat = (fromPoint.y - toPoint.y) / (fromPoint.x - toPoint.x)
            let nIntersection: CGFloat = fromPoint.y - pendant * fromPoint.x

            return { xInput in
                xInput * pendant + nIntersection
            }
        }
    }
}

