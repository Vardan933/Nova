//
//  ArticleSummary.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 11.05.26.
//

import FoundationModels

@Generable

struct ArticleSummary {
    
    @Guide(description: "One sentence headline summary")
    let headline: String
    
    @Guide(description: "3 concise key takeways")
    let bulletPoints: [String]
    
    @Guide(description: "Sentiment: positive, negative and neutral")
    let sentiment: String
    
}
