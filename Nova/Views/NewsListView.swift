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

#Preview {
    NewsListView()
}

