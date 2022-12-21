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
    @StateObject private var logicManager = LogicManager.shared
    
    @State private var showAlert = false
    
    private let sliderMinValue = 0.0
    private let sliderMaxValue = 100.0
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(logicManager.targetValue)")
            HStack {
                Text("\(lround(sliderMinValue))")
                    .padding(.leading)
                
                UISliderView(currentValue: $logicManager.currentValue,
                             targetValue: $logicManager.targetValue,
                             computedScore: $logicManager.computedScore)
                .onChange(of: logicManager.currentValue) { newValue in
                    logicManager.setSliderThumbAlpha()
                }
                
                Text("\(lround(sliderMaxValue))")
                    .padding(.trailing)
            }
            
            Button("Проверь меня!") {
                showAlert.toggle()
            }
            .alert("Your Score:", isPresented: $showAlert, actions: { }) {
                Text("\(logicManager.computedScore)")
            }
            
            
            Button("Начать Заново") {
                logicManager.targetValue = Int.random(in: Int(sliderMinValue)...Int(sliderMaxValue))
                logicManager.setSliderThumbAlpha()
            }
                .padding()
        }
       
        .onAppear {
            logicManager.setSliderThumbAlpha()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
