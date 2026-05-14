//
//  NovaTests.swift
//  NovaTests
//
//  Created by Vardan Ghazaryan on 14.05.26.
//

import Testing
@testable import Nova

@Suite("News feed logic")
struct NovaTests {
    
    @Test("Articles should be empty on app launch")
    @MainActor
    func example() async throws {
        let viewModel = NewsViewModel()
        #expect(viewModel.articles.isEmpty)
    }
    @Test("Loading test becomes true when starting fetch")
    @MainActor
    func testLoadingStateChanges() async throws {
        let viewModel = NewsViewModel()
        
        let task = Task {
            await viewModel.fetchNews()
        }
        try? await Task.sleep(for: .milliseconds(10))
        #expect(viewModel.isLoading == true)
        await task.value
    }
    
    @Test("Error message should be set if query is invalid")
    @MainActor
    func testInvalidQueryError() async throws {
        let viewModel = NewsViewModel()
        await viewModel.fetchNews(query: "   ")
        #expect(viewModel.errorMessage != nil)
        #expect(viewModel.isLoading == false)
    }
}
