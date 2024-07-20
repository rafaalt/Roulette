//
//  RouletteView.swift
//  Roulette
//
//  Created by Rafael Torga on 19/07/24.
//

import SwiftUI

struct RouletteView: View {
    
    @State private var isRotating = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var rotation: Double = 0
    
    var model: RoulleteModel
    var rouletteTime: Int = 10
    var colors = [Color.orange, Color.red, Color.green, Color.blue, Color.yellow, Color.pink, Color.cyan, Color.brown, Color.gray, Color.purple]
    
    var body: some View {
        GeometryReader { geometry in
            let widthSize = geometry.size.width
            VStack {
                ZStack {
                    ZStack {
                        ForEach(model.getElements()) { element in
                            RouletteShapeView(startAngle: element.startAngle, endAngle: element.endAngle, color: colors[element.id%10], name: element.name)
                        }
                    }
                    .rotationEffect(.degrees(rotation))
                    .animation(.easeInOut(duration: TimeInterval(rouletteTime)), value: rotation)
                    Triangle(size: .medium)
                }
                .frame(width: widthSize, height: widthSize)
                Button(action: {
                    if !self.isRotating {
                        self.isRotating = true
                        rotation += Double(Int.random(in: 1500...5000))
                        showWinner(model.getWinnerElement(rotationResult: rotation))
                    }
                }) {
                    Text("Start Rotation")
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertMessage),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func showWinner(_ winner: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(rouletteTime)) {
            self.alertMessage = "\(winner) is the Winner!"
            self.showAlert = true
            self.isRotating = false
        }
    }
    
}

#Preview {
    RouletteView(model: RoulleteModel(elements: [Element(id: 1, name: "Vermelho"), Element(id: 2, name: "Verde"), Element(id: 3, name: "Azul"), Element(id: 4, name: "Amarelo")]))
}
