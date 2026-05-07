//
//  NewsViewModel.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 06.05.26.
//

import Foundation
import Combine

@MainActor

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    func fetchNews(query: String? = nil) async {
        self.isLoading = true
        self.errorMessage = nil
        
        let apiKey = SecretsManager.apiKey
        var urlString = "https://newsdata.io/api/1/latest?apikey=\(apiKey)&language=en"
        
        if let query = query, !query.isEmpty {
                urlString += "&q=\(query)"
            }
        
        
        guard let url = URL(string: urlString) else {
            self.errorMessage = NetworkError.invalidURL.errorDescription
            self.isLoading = false
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }
            
            let decoder = JSONDecoder()
            let newsResponse = try decoder.decode(NewsResponse.self, from: data)
            
            self.articles = newsResponse.results
        } catch is DecodingError {
            self.errorMessage = NetworkError.decodingError.errorDescription
        } catch {
            self.errorMessage = NetworkError.unknown.errorDescription
        }
        
        self.isLoading = false
    }
}
