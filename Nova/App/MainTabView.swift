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
            NewsListView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            
            SavedNewsView()
                .tabItem {
                    Label("Saved", systemImage: "bookmark")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
             }
         }
        .accentColor(.blue)
    }
}

#Preview {
    MainTabView()
}
