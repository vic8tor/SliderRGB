//
//  TextFieldView.swift
//  SliderRGB
//
//  Created by Victor on 20.02.2022.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var value: Double
    @Binding var textFieldValue: String
    @State private var alertPresented = false
    
    var body: some View {
        TextField("", text: $textFieldValue)
            .frame(width: 60, alignment: .trailing)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.decimalPad)
            .onChange(of: textFieldValue) { newValue in
                textFieldValue = newValue
                checkValue()
            }
            .alert("Wrong format", isPresented: $alertPresented) {
                Text("Enter number from 0...255")
            }
    }
    private func checkValue() {
        guard let doubleValue = Double(textFieldValue), doubleValue <= 255 else {
            alertPresented.toggle()
            textFieldValue = ""
            value = 0
            return
        }
        value = doubleValue
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(value: .constant(0), textFieldValue: .constant(""))
    }
}
