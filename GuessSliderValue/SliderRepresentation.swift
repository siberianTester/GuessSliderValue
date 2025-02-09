//
//  SliderRepresentation.swift
//  GuessSliderValue
//
//  Created by Yaroslav Malygin on 08.02.2025.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    @Binding var value: Float
    var opacity: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.thumbTintColor = .red
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = value
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
        uiView.alpha = CGFloat(Float(opacity))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}

extension SliderRepresentation {
    final class Coordinator: NSObject {
        var parent: SliderRepresentation
        
        init(parent: SliderRepresentation) {
            self.parent = parent
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            parent.value = sender.value
        }
    }
}

#Preview {
//    SliderRepresentation()
}
