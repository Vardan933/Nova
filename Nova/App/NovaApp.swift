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
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: SavedArticle.self)
    }
}
