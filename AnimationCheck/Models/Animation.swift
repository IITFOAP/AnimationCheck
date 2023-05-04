//
//  Animation.swift
//  AnimationCheck
//
//  Created by Рома Баранов on 02.05.2023.
//

import Foundation

struct Animation {
    let preset: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    static func getAnimation() -> Animation {
        let result = Animation(
            preset: DataStore.shared.presets.randomElement() ?? "",
            curve: DataStore.shared.curves.randomElement() ?? "",
            force: Double.random(in: 1.1...1.99),
            duration: Double.random(in: 0.8...1.0),
            delay: DataStore.shared.delay
        )
        
        return result
    }
}
