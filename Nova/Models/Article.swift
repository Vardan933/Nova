//
//  Article.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 06.05.26.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let results: [Article]
}

struct Article: Codable, Identifiable {
    var id: String { article_id }
    
    let article_id: String
    let title: String
    let link: String
    let description: String?
    let image_url: String?
    let pubDate: String
    let source_id: String?
    let creator: [String]?
}
