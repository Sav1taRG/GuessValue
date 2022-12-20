//
//  SettingsManager.swift
//  GuessValue
//
//  Created by Roman Golubinko on 21.12.2022.
//

import Foundation

class SettingsManager: ObservableObject {
    @Published var targetValue = Int.random(in: 0...100)
    @Published var computedScore = 5
    @Published var currentValue = 50.0
    
    func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
    
    func setSliderThumbAlpha() {
        computedScore = computeScore()
    }
}
