//
//  SettingsManager.swift
//  GuessValue
//
//  Created by Roman Golubinko on 21.12.2022.
//

import Foundation

class LogicManager: ObservableObject {
    static let shared = LogicManager()
    
    @Published var targetValue = Int.random(in: 0...100)
    @Published var computedScore = 0
    @Published var currentValue = 0.0
    
    private init() { }
    
    func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
    
    func setSliderThumbAlpha() {
        computedScore = computeScore()
    }
}
