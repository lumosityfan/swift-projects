//
//  ContentView.swift
//  BucketList
//
//  Created by Jeff Xie on 3/6/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    var body: some View {
        Map(initialPosition: startPosition)
    }
}

#Preview {
    ContentView()
}
