//
//  ContentView.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 06.05.26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab("News", systemImage: "newspaper") {
                NewsListView()
            }
            
            Tab("Saved", systemImage: "bookmark") {
                SavedNewsView()
            }
            
            Tab("Settings", systemImage: "gearshape") {
                SettingsView()
            }
        }
        .tint(.accentColor)
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

#Preview {
    MainTabView()
}
