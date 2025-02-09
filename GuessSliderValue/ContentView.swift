//
//  ContentView.swift
//  GuessSliderValue
//
//  Created by Yaroslav Malygin on 08.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var contentViewVM = ContentViewViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Подвиньте бегунок как можно ближе к:")
                Text("\(contentViewVM.targetValue)")
            }
            HStack {
                Text("0")
                
                SliderRepresentation(
                    value: $contentViewVM.sliderValue,
                    opacity: contentViewVM.sliderOpacity
                )
                
                Text("100")
            }
            
            
            ButtonView.init(title: "Проверь меня!", action: contentViewVM.tryIt)
            ButtonView(title: "Начать заново", action: contentViewVM.restart)
            
        }
        .alert(isPresented: $contentViewVM.showAlert) {
                    Alert(
                        title: Text("Результат"),
                        message: Text("Ваши очки: \(contentViewVM.score)"),
                        dismissButton: .default(Text("OK"))
                    )
                }
        .padding()
    }
}

#Preview {
    ContentView()
}
