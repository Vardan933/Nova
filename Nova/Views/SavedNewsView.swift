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
                    ContentUnavailableView(
                        "No Saved News",
                        systemImage: "bookmark.slash",
                        description: Text("Articles you save will appear here.")
                    )
                } else {
                    List {
                        ForEach(savedArticles) { article in
                            NavigationLink {
                                
                                let tempArticle = Article(
                                    article_id: article.article_id,
                                    title: article.title,
                                    link: article.link,
                                    description: article.desc,
                                    image_url: article.image_url,
                                    pubDate: article.pubDate,
                                    source_id: nil,
                                    creator: nil
                                )
                                NewsDetailsView(article: tempArticle)
                            } label: {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(article.title)
                                        .font(.headline)
                                        .lineLimit(2)
                                    
                                    Text(article.pubDate)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
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
        .modelContainer(for: SavedArticle.self, inMemory: true)
}
