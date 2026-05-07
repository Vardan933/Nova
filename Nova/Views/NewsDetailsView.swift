//
//  NewsDetailsView.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 06.05.26.
//

import SwiftUI
import SwiftData

struct NewsDetailsView: View {
    // MARK: - Properties
    let article: Article
    @Environment(\.modelContext) private var modelContext
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    if let imageURL = article.image_url, let url = URL(string: imageURL) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                HStack {
                                    Spacer()
                                    ProgressView()
                                    Spacer()
                                }
                                .frame(height: 250)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width - 32)
                                    .frame(height: 250)
                                    .cornerRadius(12)
                                    .clipped()
                            case .failure:
                                failureImage
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(article.title)
                            .font(.title2)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text(article.pubDate)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Divider()
                        
                        Text(article.description ?? "No description available")
                            .font(.body)
                            .lineSpacing(6)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.horizontal)
                    .frame(width: geometry.size.width, alignment: .leading)
                }
                .padding(.vertical)
            }
        }
        .navigationTitle("News")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationToolbarButtons
            }
        }
    }
    
    // MARK: - Subviews
    private var failureImage: some View {
        ZStack {
            Color.gray.opacity(0.1)
            Image(systemName: "photo")
                .font(.largeTitle)
                .foregroundColor(.secondary)
        }
        .frame(height: 250)
        .cornerRadius(12)
    }
    
    private var navigationToolbarButtons: some View {
        HStack(spacing: 20) {
            Button(action: { shareLink(url: article.link) }) {
                Image(systemName: "square.and.arrow.up")
            }
            
            Button(action: { saveArticle() }) {
                Image(systemName: "bookmark")
            }
        }
    }
    
    // MARK: - Methods
    func shareLink(url: String) {
        guard let url = URL(string: url) else { return }
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootVC = scene.windows.first?.rootViewController {
            rootVC.present(activityVC, animated: true)
        }
    }
    
    func saveArticle() {
        let newSaved = SavedArticle(
            article_id: article.article_id,
            title: article.title,
            link: article.link,
            desc: article.description,
            image_url: article.image_url,
            pubDate: article.pubDate
        )
        modelContext.insert(newSaved)
        print("News saved to SwiftData!")
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        NewsDetailsView(article: Article(
            article_id: "1",
            title: "Real Madrid wins again!",
            link: "https://realmadrid.com",
            description: "An amazing match at Bernabeu... The team showed incredible spirit and dominated the field from the first minute.",
            image_url: "https://images.unsplash.com/photo-1574629810360-7efbbe195018",
            pubDate: "2026-05-06",
            source_id: "RM",
            creator: ["Vardan"]
        ))
    }
}
