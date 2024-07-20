//
//  TriangleShape.swift
//  Roulette
//
//  Created by Rafael Torga on 19/07/24.
//

import SwiftUI

struct Triangle: Shape {
    
    var size: ShapeSize = .big
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX-size.rawValue, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY+30))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY-30))
        path.closeSubpath()
        return path
    }
}
