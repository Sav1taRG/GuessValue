//
//  UISliderView.swift
//  GuessValue
//
//  Created by Roman Golubinko on 20.12.2022.
//

import SwiftUI

struct UISliderView: UIViewRepresentable {
    
    @Binding var currentValue: Double
    @Binding var targetValue: Int
    @State private var computedScore = 0
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        uiView.value = Float(currentValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(
            currentValue: $currentValue,
            targetValue: $targetValue,
            computedScore: $computedScore
        )
    }
    
}

struct UISliderView_Previews: PreviewProvider {
    static var previews: some View {
        UISliderView(currentValue: .constant(10),
                     targetValue: .constant(20))
    }
}


extension UISliderView {
    final class Coordinator: NSObject {
        @Binding var currentValue: Double
        @Binding var targetValue: Int
        @Binding var computedScore: Int
        
        init(currentValue: Binding<Double>,
             targetValue: Binding<Int>,
             computedScore: Binding<Int> )
        {
            self._currentValue = currentValue
            self._targetValue = targetValue
            self._computedScore = computedScore
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            self.currentValue = Double(sender.value)
            computedScore = computeScore()
            sender.thumbTintColor = UIColor(
                red: 1,
                green: 0,
                blue: 0,
                alpha: CGFloat(computedScore/100)
            )
        }
        
        private func computeScore() -> Int {
            let difference = abs(targetValue - lround(currentValue * 100))
            return 100 - difference
        }
    }
}
