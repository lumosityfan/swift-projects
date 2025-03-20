//
//  ContentView.swift
//  Moonshot
//
//  Created by Jeff Xie on 1/23/25.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingGrid = false
    @State private var selectedTab = "Grid"
    
    var body: some View {
        TabView {
            GridLayout(astronauts: astronauts, missions: missions).tabItem {
                Label("Grid", systemImage: "star")
            }
                    
            ListLayout(astronauts: astronauts, missions: missions).tabItem {
                Label("List", systemImage: "circle")
            }
        }
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
