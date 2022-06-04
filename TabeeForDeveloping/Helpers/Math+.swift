//
//  Math+.swift
//  TabeeForDeveloping
//
//  Created by Serg on 04.06.2022.
//

import UIKit

extension Double {
    var degreesToRadians: Double {
        return self * .pi / 180
    }
}
extension BinaryInteger {
    var degreesToRadians: CGFloat { CGFloat(self) * .pi / 180 }
}

extension FloatingPoint {
    var degreesToRadians: Self { self * .pi / 180 }
    var radiansToDegrees: Self { self * 180 / .pi }
}
