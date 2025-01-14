//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jeff Xie on 1/2/25.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    private var numQuestions = 8
    @State private var quesNum = 1
    
    var body: some View {
        ZStack {
                LinearGradient(stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Guess the Flag")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                    Text("Question \(quesNum)/\(numQuestions)")
                        .foregroundStyle(.white)
                    Button("Reset") { resetGame() }
                        .frame(width: 50, height: 50)
                        .background(.green)
                        .clipShape(.rect(cornerRadius: 10))
                        .border(Color.red, width: 1)
                    Spacer()
                    Spacer()
                    Text("Score: \(userScore)")
                        .foregroundStyle(.white)
                        .font(.title.bold())
                    Spacer()
                    VStack {
                        VStack {
                            Text("Tap the flag of")
                                .font(.subheadline.weight(.heavy)).foregroundStyle(.secondary)
                            Text(countries[correctAnswer])
                                .font(.largeTitle.weight(.semibold))
                        }
                        
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                Image(countries[number])
                                    .clipShape(.capsule)
                                    .shadow(radius: 5)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                }.padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if(quesNum < numQuestions)
            {
                Button("Continue", action: askQuestion)
            }
            else {
                Button("Restart", action: askQuestion)
            }
        } message: {
            if(quesNum < numQuestions) {
                Text("Your score is \(userScore)")
            }
            else {
                Text("Your final score is \(userScore)")
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        if(quesNum < numQuestions)
        {
            quesNum += 1
        }
        else {
            quesNum = 1
            userScore = 0
        }
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        quesNum = 1
        userScore = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
