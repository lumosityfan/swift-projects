//
//  ContentView.swift
//  AstroGuesser
//
//  Created by Jeff Xie on 3/23/25.
//

import SwiftUI

struct IntroView: View {
    @State private var objects = ["Orion Nebula", "30 Doradus", "HD 80606b", "WASP-17b", "WASP-121b", "LTT 9779b", "GJ 1214b", "K2-18b", "TOI-270d", "LHS 3844b", "PSR B1257+12", "WD 1856+534", "55 Cancri", "Kepler-62", "AU Microscopii", "Epsilon Eridani"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var numQuestions: Int
    @State private var questionNumber = 1
    
    init(numQuestions: Int) {
        self.numQuestions = numQuestions
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.space)
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Text("Guess the Space Object")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .frame(alignment: .center)
                    
                    Text("Question \(questionNumber)/\(numQuestions)")
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    VStack(spacing: 15) {
                        VStack {
                            Text(objects[correctAnswer])
                                .font(.largeTitle.weight(.semibold))
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(.regularMaterial)
                        .clipShape(.rect(cornerRadius: 20))
                        
                        HStack {
                            ForEach(0..<3) { number in
                                Button {
                                    objectTapped(number)
                                } label: {
                                    Text(objects[number])
                                        .foregroundStyle(.secondary)
                                }
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(.regularMaterial)
                        .clipShape(.rect(cornerRadius: 20))
                    }
                    
                    Spacer()
                    Spacer()
                    
                    Text("Score: \(score)")
                        .foregroundStyle(.white)
                        .font(.title.bold())
                    
                    Spacer()
                }
                .padding()
            }
            .alert(scoreTitle, isPresented: $showingScore)
            {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
            .navigationTitle("Space Object")
            .toolbar {
                Button("Reset") {
                    resetQuestion()
                }
                .foregroundStyle(.white)
            }
        }
    }
    
    func objectTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong \n The answer is \(objects[correctAnswer])"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        objects.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionNumber += 1
    }
    
    func resetQuestion() {
        objects.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionNumber = 1
        score = 0
    }
}

#Preview {
    IntroView(numQuestions: 10)
}
