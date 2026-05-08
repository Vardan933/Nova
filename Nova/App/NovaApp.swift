//
//  NovaApp.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 06.05.26.
//

import SwiftUI
import SwiftData

@main
struct NovaApp: App {
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    var body: some Scene {
        WindowGroup {
            
            if hasSeenOnboarding {
                MainTabView()
            } else {
                OnboardingView()
            }
        }
        .modelContainer(for: SavedArticle.self)
    }
}
