//
//  Slider.swift
//  SliderRGB
//
//  Created by Victor on 19.02.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @Binding var displayValue: String
    @State private var alertPresented = false
    
    let color: Color
    var action: (String) -> Void
    
    var body: some View {
        HStack(spacing: 20) {
            Text("\(lround(value))")
                .foregroundColor(color)
                .frame(width: 40)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
            TextField("", text: $displayValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .frame(width: 60, alignment: .trailing)
                .onChange(of: displayValue) { newValue in
                    checkValue()
                    action(newValue)
                }
                .alert("Wrong format", isPresented: $alertPresented) {
                    Text("Enter number from 0...255")
                }

        }
        
    }
    
    private func checkValue() {
        guard let doubleValue = Double(displayValue), doubleValue <= 255 else {
            displayValue = ""
            alertPresented.toggle()
            return
        }
        value = doubleValue
        displayValue = ""
    }
}

struct ColorSlider_Preview: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(0.0), displayValue: .constant(""), color: .red, action: {_ in })
    }
}
