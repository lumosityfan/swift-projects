//
//  ContentView.swift
//  ChallengeOne
//
//  Created by Jeff Xie on 12/29/24.
//

import SwiftUI

struct ContentView: View {
    let unitList = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var inputValue = 0.0
    @State private var inputUnit = ""
    @State private var outputValue = 0.0
    @State private var outputUnit = ""
    
    var newValue: Double {
        if(inputUnit == "Fahrenheit") {
            if(outputUnit == "Celsius") {
                return (inputValue - 32) * (5/9)
            }
            if(outputUnit == "Kelvin") {
                return (inputValue - 32) * (5/9) + 273.15
            }
        }
        if(inputUnit == "Celsius"){
            if(outputUnit == "Fahrenheit"){
                return (inputValue * 9/5) + 32
            }
            if(outputUnit == "Kelvin"){
                return inputValue + 273.15
            }
        }
        if(inputUnit == "Kelvin"){
            if(outputUnit == "Fahrenheit"){
                return ((inputValue - 273.15) - 32) * (5/9)
            }
            if(outputUnit == "Celsius"){
                return inputValue - 273.15
            }
        }
        return inputValue
    }
    var body: some View {
        Form {
            Section("Input data") {
                Picker("Input unit", selection: $inputUnit) {
                    ForEach(unitList, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.segmented)
                
                TextField("Input value", value: $inputValue, format: .number)

            }
            Section("Output data") {
                Picker("Output unit", selection: $outputUnit) {
                    ForEach(unitList, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.segmented)
                Text(newValue, format: .number)
            }
        }
    }
}

#Preview {
    ContentView()
}
