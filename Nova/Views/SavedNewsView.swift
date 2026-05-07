//
//  SavedNewsView.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 06.05.26.
//

import SwiftUI
import SwiftData

struct SavedNewsView: View {
    @Query var savedArticles: [SavedArticle]
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        NavigationStack {
                    Group {
                        if savedArticles.isEmpty {
                            ContentUnavailableView("No Saved News",
                                                 systemImage: "bookmark.slash",
                                                 description: Text("Articles you save will appear here."))
                        } else {
                            List {
                                ForEach(savedArticles) { article in
                                    VStack(alignment: .leading) {
                                        Text(article.title)
                                            .font(.headline)
                                        Text(article.pubDate)
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .onDelete(perform: deleteArticle) 
                            }
                        }
                    }
                    .navigationTitle("Saved")
                }
            }

            func deleteArticle(at offsets: IndexSet) {
                for index in offsets {
                    let articleToDelete = savedArticles[index]
                    modelContext.delete(articleToDelete)
                }
            }
        }

#Preview {
    SavedNewsView()
}
