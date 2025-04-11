//
//  ContentView.swift
//  DiceGame
//
//  Created by Jeff Xie on 4/5/25.
//

import SwiftUI

struct DiceRoll: Hashable {
    var result: Int
    var numDice: Int
    var sizeDice: Int
    var indDice = [Int]()
}

struct ContentView: View {
    @State private var previousRolls = [DiceRoll]()
    @State private var currentRoll = [Int]()
    @State private var indDice = [Int]()
    @State private var numDice = 1
    @State private var sizeDice = 6
    @State private var sizeOptions = [4, 6, 8, 10, 20, 100]
    @State private var rollTotal = 0
    
    func rollDice(numDice: Int, sizeDice: Int) -> [Int] {
        var indDice = [Int]()
        let count = 1...numDice
        for _ in count {
            indDice.append(Int.random(in: 1...sizeDice))
        }
        return indDice
    }
    
    var body: some View {
        NavigationStack {
            List {
                Stepper("Number of dice: \(numDice)", value: $numDice, in: 1...10)
                Picker("Size of dice", selection: $sizeDice) {
                    ForEach(sizeOptions, id: \.self) {
                        Text(String($0))
                    }
                }
                Button("Roll Dice") {
                    currentRoll = rollDice(numDice: numDice, sizeDice: sizeDice)
                    for diceRoll in currentRoll {
                        rollTotal += diceRoll
                    }
                    withAnimation {
                        previousRolls.insert(DiceRoll(result: rollTotal, numDice: numDice, sizeDice: sizeDice, indDice: currentRoll), at: 0)
                    }
                }
                if(currentRoll.count != 0) {
                    Text("Result: \(currentRoll)")
                } else {
                    Text("Result: ")
                }
                
                Section("Roll History") {
                    ForEach(previousRolls, id: \.self) { roll in
                        HStack {
                            Image(systemName: "\(roll.numDice).circle")
                            Image(systemName: "\(roll.sizeDice).circle")
                            Text("Result: \(roll.indDice) =")
                            Text(String(roll.result))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
