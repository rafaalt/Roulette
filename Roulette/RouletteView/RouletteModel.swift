//
//  RouletteModel.swift
//  Roulette
//
//  Created by Rafael Torga on 19/07/24.
//

import Foundation

class RoulleteModel: ObservableObject {
    @Published private var elements: [Element]
    
    private var totalValue: Double = 0
    var sizePerShape: Double = 360
    
    init(elements: [Element]) {
        self.elements = elements
        checkSizes()
    }
    
    private func checkSizes() {
        self.sizePerShape = Double(360)/Double(getNumberElements())
        var startAngle: Double = 0
        for element in elements {
            element.setAngles(startAngle: startAngle, endAngle: startAngle+self.sizePerShape)
            startAngle += self.sizePerShape
        }
    }
    
    func addElement(name: String) {
        let element = Element(id: getNumberElements() + 1, name: name)
        elements.append(element)
        print(element)
        checkSizes()
        print(element.endAngle - element.startAngle)
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
