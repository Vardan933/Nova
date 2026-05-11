//
//  SummaryViewModel.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 11.05.26.
//
import Foundation
import FoundationModels
import Combine

class SummaryViewModel: ObservableObject {
    
    @Published var inputText = ""
    @Published var summary: ArticleSummary?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let session = LanguageModelSession {
        
        """
        You are a news article analyzer.
        Always be concise and neutral
        
        """
    }
    //MARK: - Real device needed so we are mocking data
    
    @MainActor
    func analyze() async {
        guard !inputText.isEmpty else { return }
        isLoading = true
        errorMessage = nil
        
        
        print("Force loading Mock Data for UI testing...")
        
        do {
        
            try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
            
            self.summary = ArticleSummary(
                headline: "Yerevan Tech Scene: Breaking the AI Barrier",
                bulletPoints: [
                    "Mock data is now working perfectly",
                    "UI is responsive and ready for testing",
                    "Junior iOS devs are crushing it with SwiftUI"
                ],
                sentiment: "Positive"
            )
        } catch {
            errorMessage = "Something went wrong with the timer."
        }
        
        isLoading = false
    }
}
    
    /*func analyze() async {
        guard !inputText.isEmpty else { return }
        isLoading = true
        errorMessage = nil
        
        let availability = SystemLanguageModel.default.availability
        
        switch availability {
        case .available:
           
            do {
                let response = try await session.respond(to: "Analyze this article: \(inputText)", generating: ArticleSummary.self)
                summary = response.content
            } catch {
                errorMessage = error.localizedDescription
            }
            
        case .unavailable(let reason):
            print("AI unavailable reason: \(reason)")
            
            
            try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)
            
          
            self.summary = ArticleSummary(
                headline: "Yerevan Tech Hub: The Future of iOS Development",
                bulletPoints: [
                    "Programmatic UI is still king in professional projects",
                    "On-device AI will change how we build apps",
                    "SwiftUI and SwiftData are essential for 2026"
                ],
                sentiment: "Positive"
            )
        @unknown default:
            errorMessage = "Unknown AI status"
        }
        
        isLoading = false
    }
}
     
     
     //MARK: - Response code without checking device availablity
     */
//        do {
//            let response = try await session.respond(to: "Analyze this article \(inputText)", generating: ArticleSummary.self)
//            summary = response.content
//        } catch {
//            errorMessage = error.localizedDescription
//        }
//        isLoading = false 
//    }
//}
