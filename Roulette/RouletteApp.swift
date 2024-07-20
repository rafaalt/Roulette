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
                                                         Element(id: 2, name: "Verde")
                                                        ]))
        }
    }
}
