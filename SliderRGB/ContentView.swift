//
//  ContentView.swift
//  SliderRGB
//
//  Created by Victor on 19.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)
    
    @State private var redDisplayValue = ""
    @State private var greenDisplayValue = ""
    @State private var blueDisplayValue = ""
    
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.2).ignoresSafeArea()
            VStack(spacing: 30) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 350, height: 150)
                    .padding()
                    .foregroundColor(
                        Color(red: redValue,
                              green: greenValue,
                              blue: blueValue)
                    )
                
                ColorSliderView(
                    value: $redValue, displayValue: $redDisplayValue, color: .red) { textFieldValue in
                        redDisplayValue = textFieldValue
                    }
                
                ColorSliderView(
                    value: $greenValue, displayValue: $greenDisplayValue, color: .green) { textFieldValue in
                        greenDisplayValue = textFieldValue
                    }
                
                ColorSliderView(
                    value: $blueValue, displayValue: $blueDisplayValue, color: .blue) { textFieldValue in
                        blueDisplayValue = textFieldValue
                    }
            }
            .padding(30)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


