//
//  ContentView.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 06.05.26.
//

import SwiftUI

struct MainTabView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
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
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    MainTabView()
}
