//
//  ContentView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 01/07/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dependencyContainer: DependencyContainer
    
    var body: some View {
        NavigationStack {
            Text("Thmanyah")
                .navigationTitle("Audio Content")
        }
    }
}

#Preview {
    ContentView()
}
