//
//  ContentViewViewModel.swift
//  GuessSliderValue
//
//  Created by Yaroslav Malygin on 08.02.2025.
//

import Foundation

final class ContentViewViewModel: ObservableObject {
    @Published var targetValue = Int.random(in: 0...100)
    @Published var sliderValue = Float.random(in: 0...100)
    @Published var showAlert = false
    @Published var score = 0
    
    var sliderOpacity: Double {
        let distance = abs(Double(sliderValue) - Double(targetValue))
        return 1.0 - (distance / 100)
    }
    
    func tryIt() {
        score = computeScore()
        showAlert = true
    }
    
    func restart() {
        targetValue = Int.random(in: 0...100)
        sliderValue = Float.random(in: 0...100)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(sliderValue)))
        return 100 - difference
    }
}
