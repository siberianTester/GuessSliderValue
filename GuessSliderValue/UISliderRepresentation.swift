//
//  SliderRepresentation.swift
//  GuessSliderValue
//
//  Created by Yaroslav Malygin on 08.02.2025.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var value: Float
    let opacity: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.thumbTintColor = .red
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = value
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.alpha = CGFloat(opacity)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension UISliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = sender.value
        }
    }
}

#Preview {
    UISliderRepresentation(value: .constant(50), opacity: 1)
}
