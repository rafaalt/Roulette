//
//  Element.swift
//  Roulette
//
//  Created by Rafael Torga on 19/07/24.
//

import Foundation

class Element: Identifiable {
    var id: Int
    var name: String
    var startAngle: Double = 0
    var endAngle: Double = 0
    var angleSize: Double = 0
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    func setAngles(startAngle: Double, endAngle: Double) {
        self.startAngle = startAngle
        self.endAngle = endAngle
        self.angleSize = endAngle - startAngle
    }
}
