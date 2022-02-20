//
//  Slider.swift
//  SliderRGB
//
//  Created by Victor on 19.02.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @Binding var textFieldValue: String
    
    let color: Color
    
    var body: some View {
        HStack(spacing: 20) {
            Text("\(lround(value))")
                .foregroundColor(color)
                .frame(width: 40)
            Slider(value: $value, in: 0...255, step: 1, onEditingChanged: { (_) in
                textFieldValue = String(lround(value))
            })
                .tint(color)
            
            TextFieldView(value: $value, textFieldValue: $textFieldValue)
        }
        .onAppear {
            textFieldValue = "\(lround(value))"
        }
    }
}

struct ColorSlider_Preview: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(0.0), textFieldValue: .constant(""), color: .red)
    }
}
