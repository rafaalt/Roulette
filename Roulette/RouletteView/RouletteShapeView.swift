//
//  RouletteShapeView.swift
//  Roulette
//
//  Created by Rafael Torga on 20/07/24.
//

import SwiftUI

struct RouletteShapeView: View {
    
    var startAngle: Double
    var endAngle: Double
    var color: Color
    var name: String
    var imageSize: Double
    
    init(startAngle: Double, endAngle: Double, color: Color, name: String) {
        self.startAngle = startAngle
        self.endAngle = endAngle
        self.color = color
        self.name = name
        self.imageSize = 2*(endAngle - startAngle)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RouletteShape(startAngle: startAngle, endAngle: endAngle)
                    .fill(color)
                
                Image("mp10")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(maxWidth: imageSize, maxHeight: 80)
                    .rotationEffect(self.imageRotation())
                    .position(self.imagePosition(in: geometry.size))
            }
        }
    }
    
    private func imagePosition(in size: CGSize) -> CGPoint {
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        let radius = min(size.width, size.height) / 2 / 1.5
        let midAngle = (startAngle + endAngle) / 2
        let x = center.x + radius * CGFloat(cos(Angle(degrees: midAngle).radians))
        let y = center.y + radius * CGFloat(sin(Angle(degrees: midAngle).radians))
        return CGPoint(x: x, y: y)
    }
    
    private func imageRotation() -> Angle {
        let midAngle = (startAngle + endAngle) / 2
        return Angle(degrees: midAngle + 90)
    }
}

#Preview {
    RouletteShapeView(startAngle: 0, endAngle: 180, color: .red, name: "Rafael")
}
