//
//  ContentView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 01/07/2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
           TabView {
               NavigationView {
                   HomeView()
               }
               .tabItem {
                   Image(systemName: "house.fill")
                   Text("Home")
               }
               
               NavigationView {
                   SearchView()
               }
               .tabItem {
                   Image(systemName: "magnifyingglass")
                   Text("Search")
               }
           }
           .accentColor(DesignSystem.Colors.accent)
       }
}

#Preview {
    ContentView()
}
