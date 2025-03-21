//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Jeff Xie on 3/21/25.
//

import SwiftUI
import SwiftData

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
