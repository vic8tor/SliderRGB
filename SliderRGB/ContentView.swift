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
    
    @FocusState var isInputActive: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.2).ignoresSafeArea()
                VStack(spacing: 30) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 350, height: 150)
                        .padding()
                        .foregroundColor(
                            Color(red: redValue / 255,
                                  green: greenValue / 255,
                                  blue: blueValue / 255)
                        )
                        .navigationTitle("Color Pallete")
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    isInputActive = false
                                    
                                    
                                }
                            }
                        }
                    ColorSliderView(
                        value: $redValue, textFieldValue: $redDisplayValue, color: .red)
                    
                    ColorSliderView(
                        value: $greenValue, textFieldValue: $greenDisplayValue, color: .green)
                    
                    ColorSliderView(
                        value: $blueValue, textFieldValue: $blueDisplayValue, color: .blue)
                }
                .padding(30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


