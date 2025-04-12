//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Jeff Xie on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    let numQuestions = [5, 10, 20]
    @State private var firstNum = 0 // stores beginning of multiplication table range
    @State private var lastNum = 0 // stores end of multiplication table range
    
    var body: some View {
        Section {
            VStack {
                Spacer()
                Text("First number of multiplication table range")
                HStack {
                    ForEach(2...12, id: \.self) { num in
                        Button(String(num)) {
                            firstNum = num
                        }
                    }
                }
                Text("Last number of multiplication table range")
                HStack {
                    ForEach(2...12, id: \.self) { num in
                        Button(String(num)) {
                            lastNum = num
                        }
                        .background(.red)
                        .clipShape(.rect(cornerRadius: 20))
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
