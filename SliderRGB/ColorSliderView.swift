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
    
    var body: some View {
        HStack(spacing: 20) {
            Text("\(lround(value))")
                .foregroundColor(color)
                .frame(width: 40)
            Slider(value: $value, in: 0...255, step: 1, onEditingChanged: { (_) in
                displayValue = String(lround(value))
            })
                .tint(color)
            TextField("", text: $displayValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .frame(width: 60, alignment: .trailing)
                .onChange(of: displayValue) { newValue in
                    checkValue()
                    displayValue = newValue
                }
                .alert("Wrong format", isPresented: $alertPresented) {
                    Text("Enter number from 0...255")
                }
        }
        .onAppear {
            displayValue = "\(lround(value))"
        }
        
    }
    
    private func checkValue() {
        guard let doubleValue = Double(displayValue), doubleValue <= 255 else {
            alertPresented.toggle()
            displayValue = ""
            value = 0
            return
        }
        value = doubleValue
    }
}

struct ColorSlider_Preview: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(0.0), displayValue: .constant(""), color: .red)
    }
}
