//
//  ContentView.swift
//  GuessValue
//
//  Created by Roman Golubinko on 20.12.2022.
//

import SwiftUI

struct ContentView: View {
//    @State private var currentValue = 50.0
//    @State private var targetValue = Int.random(in: 0...100)
    @StateObject var settingsManager = SettingsManager()
    
    private let sliderMinimumValue = 0.0
    private let sliderMaximumValue = 100.0
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(settingsManager.targetValue)")
            HStack {
                Text("\(lround(sliderMinimumValue))")
                    .padding(.leading)
                UISliderView(currentValue: $settingsManager.currentValue,
                             targetValue: $settingsManager.targetValue,
                             computedScore: $settingsManager.computedScore)
                .onChange(of: settingsManager.currentValue) { newValue in
                    settingsManager.setSliderThumbAlpha()
                }
                Text("\(lround(sliderMaximumValue))")
                    .padding(.trailing)
            }
            Button("Проверь меня!", action: { })
            Button("Начать Заново") {
                settingsManager.targetValue = Int.random(in: Int(sliderMinimumValue)...Int(sliderMaximumValue))
            }
                .padding()
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
