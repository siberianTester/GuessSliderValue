//
//  ButtonView.swift
//  GuessSliderValue
//
//  Created by Yaroslav Malygin on 08.02.2025.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
        }
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Some Action", action: {})
    }
}
