//
//  ContentView.swift
//  GuessValue
//
//  Created by Roman Golubinko on 20.12.2022.
//

import SwiftUI

struct ContentView: View {
//    @State private var currentValue: Double
//    @State private var targetValue: Int
    
    private let sliderMinimumValue = 0.0
    private let sliderMaximumValue = 100.0
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            HStack {
                Text("\(lround(sliderMinimumValue))")
                UISliderView(currentValue: $currentValue, targetValue: $targetValue)
                Text("\(lround(sliderMaximumValue))")
            }
            Button("Проверь меня!", action: { })
            Button("Начать Заново", action: { })
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
