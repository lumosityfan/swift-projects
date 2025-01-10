//
//  ContentView.swift
//  PlayingWithStacks
//
//  Created by Jeff Xie on 1/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0){
                Color.red
                Color.blue
            }
            Text("your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
