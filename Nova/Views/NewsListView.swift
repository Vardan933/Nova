//
//  NewsListView.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 06.05.26.
//

import SwiftUI

struct NewsListView: View {
  @StateObject private var viewModel = NewsViewModel()
    @State private var searchText = ""
    
    var body: some View {
            NavigationStack {
                ZStack {
                    
                    if viewModel.isLoading && viewModel.articles.isEmpty {
                        ProgressView("Loading Nova News...")
                    }
                    else if let error = viewModel.errorMessage {
                        VStack(spacing: 16) {
                            Image(systemName: "wifi.exclamationmark")
                                .font(.largeTitle)
                            Text(error)
                                .multilineTextAlignment(.center)
                            Button("Retry") {
                                Task { await viewModel.fetchNews() }
                            }
                            .buttonStyle(.bordered)
                        }
                        .padding()
                    }
                    else {
                        List(viewModel.articles, id: \.article_id) { article in
                            NavigationLink(destination: NewsDetailsView(article: article)) {
                                NewsRowView(article: article)
                            }
                        }
                        .listStyle(.plain)
                    }
                }
                .navigationTitle("Nova News")
                .searchable(text: $searchText, prompt: "Search news...")
                .onChange(of: searchText) { oldValue, newValue in
                    Task {
                        await viewModel.fetchNews(query: newValue)
                    }
                }
                .task {
                    await viewModel.fetchNews()
                }
                .refreshable {
                    await viewModel.fetchNews(query: searchText)
                }
            }
        }
    }

struct NewsRowView: View {
    let article: Article
    
    var body: some View {
        HStack(spacing: 12) {
            if let imageURL = article.image_url, let url = URL(string: imageURL) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray.opacity(0.1)
                }
                .frame(width: 80, height: 80)
                .cornerRadius(8)
                .clipped()
            } else {
                Image(systemName: "photo")
                    .frame(width: 80, height: 80)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(article.pubDate)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    NewsListView()
}

