//
//  ContentView.swift
//  PlayingWithStacks
//
//  Created by Jeff Xie on 1/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var body: some View {
        ZStack {
            VStack(spacing: 0){
                Color.red
                Color.blue
            }
            Text("your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.green.gradient)
        }
        
        LinearGradient(stops: [
            .init(color: .white, location: 0.45),
            .init(color: .black, location: 0.55),], startPoint: .top, endPoint: .bottom)
        
        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
        
        Button("Delete selection", role: .destructive) {
            print("Now deleting...")
        }.buttonStyle(.borderedProminent)
            .tint(.mint)
        
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("OK") {}
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        } message: {
        Text("Please read this.")
        }
        Button { showingAlert = true } label: {
            Text("Tap me!")
                .padding()
                .foregroundStyle(.white)
                .background(.red).alert("Button was tapped", isPresented: $showingAlert) {
                    Button("OK") {}
                }
        }
        
        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
    }
}

#Preview {
    ContentView()
}
