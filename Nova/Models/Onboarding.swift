//
//  Onboarding.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 08.05.26.
//

import Foundation

struct Onboarding: Identifiable {
    
    let id = UUID()
    let animationName: String
    let title: LocalizedStringResource
    let description: LocalizedStringResource
    
}
