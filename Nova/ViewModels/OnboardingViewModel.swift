//
//  OnboardingViewModel.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 08.05.26.
//

import SwiftUI
import Combine

class OnboardingViewModel: ObservableObject {
    
    @Published var current = 0
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    let pages: [Onboarding] = [
        Onboarding(animationName: "news_anim", title: "Stay updated", description: "Get the latest news directly from global sources in real-time."),
        Onboarding(animationName: "save_anim", title: "Offline reading", description: "Save your favorite articles using SwiftData to read them even without internet."),
        Onboarding(animationName: "design_anim", title: "Modern design", description: "Experience Nova's Liquid Glass interface for a premium news discovery.")
        
        ]
    
    func nextStep() {
            if current < pages.count - 1 {
                withAnimation {
                    current += 1
                }
            } else {
                finishOnboarding()
            }
        }
        
        func finishOnboarding() {
            withAnimation {
                hasSeenOnboarding = true
            }
        }
    }
