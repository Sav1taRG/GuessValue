//
//  ContentView.swift
//  GuessValue
//
//  Created by Roman Golubinko on 20.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var computedScore = 0
    @State private var currentValue = 0.0
    
    @State private var showAlert = false
    
    private let sliderMinValue = 0.0
    private let sliderMaxValue = 100.0
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            HStack {
                Text("\(lround(sliderMinValue))")
                    .padding(.leading)
                
                UISliderView(currentValue: $currentValue,
                             targetValue: $targetValue,
                             computedScore: $computedScore)
                .onChange(of: currentValue) { newValue in
                    setSliderThumbAlpha()
                }
                
                Text("\(lround(sliderMaxValue))")
                    .padding(.trailing)
            }
            
            Button("Проверь меня!") {
                showAlert.toggle()
            }
            .alert("Your Score:", isPresented: $showAlert, actions: { }) {
                Text("\(computedScore)")
            }
            
            
            Button("Начать Заново") {
                targetValue = Int.random(in: Int(sliderMinValue)...Int(sliderMaxValue))
                setSliderThumbAlpha()
            }
            .padding()
        }
        .onAppear {
            setSliderThumbAlpha()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
    
    private func setSliderThumbAlpha() {
        computedScore = computeScore()
    }
}
