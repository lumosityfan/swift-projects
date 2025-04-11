//
//  IntroView.swift
//  AstroGuesser
//
//  Created by Jeff Xie on 4/2/25.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfQuestions = 0
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("How many questions would you like?")
                    Picker("Number of questions", selection: $numberOfQuestions) {
                        ForEach(1..<25) {
                            Text("\($0) questions")
                        }
                    }
                }
                
                Section {                        NavigationLink {       IntroView(numQuestions: numberOfQuestions)
                    } label: {
                        Text("Submit")
                    }
                }
            }
            .navigationTitle("AstroGuesser")
        }
    }
}

#Preview {
    ContentView()
}
