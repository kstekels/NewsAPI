//
//  WebService2.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 03/02/2023.
//

import Foundation

protocol WebServiceProtocolAsync {
    func fetchSourcesAsync(url: URL?) async throws -> [NewsSource]
    func fetchNewsAsync(url: URL?) async throws -> [NewsArticle]
}

class WebServiceAsync: WebServiceProtocolAsync {
    // Async
    func fetchSourcesAsync(url: URL?) async throws -> [NewsSource] {
        guard let url = url else {
            return []
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let newsSourceResponse = try? JSONDecoder().decode(NewsSourceResponse.self, from: data)
        
        return newsSourceResponse?.sources ?? []
    }
    
    func fetchNewsAsync(url: URL?) async throws -> [NewsArticle] {
        guard let url = url else {
            return []
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let newsArticleResponse = try? JSONDecoder().decode(NewsArticleResponse.self, from: data)
        
        return newsArticleResponse?.articles ?? []
    }
}
