//
//  WebService.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 02/02/2023.
//

import Foundation

protocol WebServiceProtocol {
    func fetchSources(url: URL?, completion: @escaping (Result<[NewsSource], NetworkError>) -> Void)
    func fetchNews(by sourceId: String, url: URL?, completion: @escaping (Result<[NewsArticle], NetworkError>) -> Void)
}

class WebService: WebServiceProtocol {
    
    func fetchSources(url: URL?, completion: @escaping (Result<[NewsSource], NetworkError>) -> Void) {
        // 1. Check URL
        guard let url = url else {
            completion(.failure(.badUrl))
            return
        }
        
        // 2. Create URLSession
        URLSession.shared.dataTask(with: url) { data, _, error in
            // 3. Check data/error
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            // 4. Decode JSON
            let newsSourceResponse = try? JSONDecoder().decode(NewsSourceResponse.self, from: data)
            completion(.success(newsSourceResponse?.sources ?? []))
        }.resume()
    }
    
    func fetchNews(by sourceId: String, url: URL?, completion: @escaping (Result<[NewsArticle], NetworkError>) -> Void) {
        
        guard let url = url else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            let newsArticleResponse = try? JSONDecoder().decode(NewsArticleResponse.self, from: data)
            completion(.success(newsArticleResponse?.articles ?? []))
        }.resume()
        
    }
    
}
