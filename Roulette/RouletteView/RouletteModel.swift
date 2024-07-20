//
//  RouletteModel.swift
//  Roulette
//
//  Created by Rafael Torga on 19/07/24.
//

import Foundation

class RoulleteModel {
    private var elements: [Element]
    private var totalValue: Double = 0
    
    init(elements: [Element]) {
        self.elements = elements
        let sizePerShape = Double(360)/Double(getNumberElements())
        var startAngle: Double = 0
        for element in elements {
            element.setAngles(startAngle: startAngle, endAngle: startAngle+sizePerShape)
            startAngle += sizePerShape
        }
    }
    
    func getTotalValue() -> Int {
        return Int(self.totalValue)
    }
    
    func getNumberElements() -> Int {
        return self.elements.count
    }
    
    func getElements() -> [Element] {
        return self.elements
    }
    
    func getWinnerElement(rotationResult: Double) -> String {
        let checkWinner = 360 - rotationResult.truncatingRemainder(dividingBy: 360)
        for element in elements {
            if element.startAngle < checkWinner && element.endAngle >= checkWinner {
                return element.name
            }
        }
        return "No winner"
    }
}
