//
//  RouletteApp.swift
//  Roulette
//
//  Created by Rafael Torga on 19/07/24.
//

import SwiftUI

@main
struct RouletteApp: App {
    var body: some Scene {
        WindowGroup {
            RouletteView(model: RoulleteModel(elements: [Element(id: 1, name: "Vermelho"), 
                                                         Element(id: 2, name: "Verde"),
                                                         Element(id: 3, name: "Azul"),
                                                         Element(id: 4, name: "Amarelo"),
                                                         Element(id: 5, name: "Rosa"),
                                                         Element(id: 6, name: "Cyan"),
                                                         Element(id: 7, name: "Marrom"),
                                                         Element(id: 8, name: "Cinza"),
                                                         Element(id: 9, name: "Roxo"),
                                                         Element(id: 10, name: "Orange"),
                                                         Element(id: 11, name: "Vermelho 2"),
                                                         Element(id: 12, name: "Verde 2")
                                                        ]))
        }
    }
}
