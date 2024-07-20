//
//  RouletteShape.swift
//  Roulette
//
//  Created by Rafael Torga on 19/07/24.
//

import Foundation
import SwiftUI

struct RouletteShape: Shape {
    
    var startAngle: Double
    var endAngle: Double
    var size: ShapeSize = .giant
    var clockwise: Bool = false

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2 - size.rawValue
        var path = Path()

        path.move(to: center)
        path.addArc(center: center, radius: radius, startAngle: .degrees(startAngle), endAngle: .degrees(endAngle), clockwise: clockwise)
        path.closeSubpath()

        return path
    }
}

enum ShapeSize: Double {
    case giant = 20
    case big = 50
    case medium = 80
    case small = 120
}

