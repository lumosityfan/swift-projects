//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jeff Xie on 1/2/25.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        VStack {
            Text("Tap the flag of")
            Text(countries[correctAnswer])
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
