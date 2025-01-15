//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Jeff Xie on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    let numQuestions = ["5", "10", "20"]
    @State private var questionAmount = 0
    
    var body: some View {
        Form {
            Picker("Number of questions", selection: $questionAmount) {
                ForEach(numQuestions, id: \.self) {
                    Text($0)
                }.pickerStyle(.segmented)
            }
        }
    }
}

#Preview {
    ContentView()
}
