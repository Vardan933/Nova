//
//  NewsRowView.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 07.05.26.
//

import SwiftUI

struct NewsRowView: View {
    let article: Article
    
    var body: some View {
        HStack(spacing: 5) {
            if let imageURL = article.image_url, let url = URL(string: imageURL) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                   
                    Rectangle().fill(.ultraThinMaterial)
                }
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.ultraThinMaterial)
                    Image(systemName: "photo")
                        .foregroundColor(.secondary)
                }
                .frame(width: 80, height: 80)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                
                Text(article.pubDate.formattedDate())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(12)
        
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1.5)
                )
        )
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
#Preview {
    NewsRowView(article: Article(
            article_id: "preview_id",
            title: "Real Madrid dominates Champions League again!",
            link: "https://realmadrid.com",
            description: "A great victory for the kings of Europe...",
            image_url: "https://images.unsplash.com/photo-1574629810360-7efbbe195018",
            pubDate: "2026-05-07",
            source_id: "RM",
            creator: ["Vardan"]
        ))
        .background(Color.blue.opacity(0.3))
}
