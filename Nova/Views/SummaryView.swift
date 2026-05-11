//
//  SummaryView.swift
//  Nova
//
//  Created by Vardan Ghazaryan on 11.05.26.
//

import SwiftUI

struct SummaryView: View {
    
    @StateObject private var viewModel = SummaryViewModel()
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    TextEditor(text: $viewModel.inputText)
                        .frame(height: 150)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.3)))
                    Button("Analyze") {
                        Task {await viewModel.analyze()}
                    }
                    .disabled(viewModel.isLoading || viewModel.inputText.isEmpty)
                    
                    if viewModel.isLoading {
                        ProgressView("Analyzing...")
                    }
                    
                    if let summary = viewModel.summary {
                        Text(summary.headline)
                            .font(.headline)
                        
                        ForEach(summary.bulletPoints, id: \.self) { point in
                            Label(point, systemImage: "circle.fill")
                                .font(.subheadline)
                                
                            }
                        Text("Sentiment: \(summary.sentiment)")
                            .foregroundStyle(summary.sentiment.lowercased() == "positive" ? .green : .secondary)
                                         }
                                         
                                         if let error = viewModel.errorMessage {
                                             Text(error).foregroundStyle(.red)
                                         }
                                     }
                                     .padding()
                                 }
                                 .navigationTitle("AI Summary")
                             }
                         }
                     }

#Preview {
    SummaryView()
}
