//
//  SavedArticle.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 06.05.26.
//

import Foundation
import SwiftData

@Model
class SavedArticle {
    @Attribute(.unique) var article_id: String
    var title: String
    var link: String
    var desc: String?
    var image_url: String?
    var pubDate: String
    
    init(article_id: String, title: String, link: String, desc: String? = nil, image_url: String? = nil, pubDate: String) {
        self.article_id = article_id
        self.title = title
        self.link = link
        self.desc = desc
        self.image_url = image_url
        self.pubDate = pubDate
    }
}

