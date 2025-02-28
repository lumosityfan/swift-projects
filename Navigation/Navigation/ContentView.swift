//
//  ContentView.swift
//  Navigation
//
//  Created by Jeff Xie on 1/23/25.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct ContentView: View {
    @State private var path = [Int]()
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }
                Button("Show 64") {
                    path.append(64)
                }
            }
            .navigationDestination(for: Int.self) { selection in Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
