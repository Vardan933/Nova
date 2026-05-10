//
//  OnboardingView.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 08.05.26.
//

import SwiftUI
import Lottie

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue.opacity(0.3), .white.opacity(0.3), .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                TabView(selection: $viewModel.current) {
                    ForEach(0..<viewModel.pages.count, id: \.self) { index in
                        OnboardingSlide(step: viewModel.pages[index])
                            .tag(index)
                        
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                
                Button(action: { viewModel.nextStep() }) {
                    Text(viewModel.current == viewModel.pages.count - 1 ? "Get Started" : "Next")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(.white.opacity(0.3), lineWidth: 1))
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 50)
            }
        }
    }
}

struct OnboardingSlide: View {
    let step: Onboarding
    
    var body: some View {
        VStack(spacing: 30) {
            LottieView(animation: .named(step.animationName))
                .looping()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .scaleEffect(step.animationName == "news_anim" ? 1.6 : 1.0)
                    .clipped()
            
            VStack(spacing: 15) {
                Text(step.title)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.8)
                    .lineLimit(2)
                
                Text(step.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 40)
                    .minimumScaleFactor(0.7)
                    .lineLimit(3)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
