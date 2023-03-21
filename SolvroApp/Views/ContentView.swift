//
//  ContentView.swift
//  SolvroApp
//
//  Created by Jakub Chojak on 20/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BeerListView()
                .tabItem {
                    Label("Piwa", systemImage: "mug.fill")
                }
            LikedBeersView()
                .tabItem {
                    Label("Ulubione", systemImage: "heart.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Ustawienia", systemImage: "gear")
                }
        }
    }
}
