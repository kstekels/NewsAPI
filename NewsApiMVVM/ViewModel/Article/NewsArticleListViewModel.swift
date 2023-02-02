//
//  NewsArticleListViewModel.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 02/02/2023.
//

import Foundation

class NewsArticleListViewModel: ObservableObject {
    
    @Published var newsArticles = [NewsArticleViewModel]()
    
    func getNewsBy(sourceId: String) {
        WebService().fetchNews(
            by: sourceId,
            url: Constants.Urls.topHeadlines(by: sourceId)
        ) { result in
            switch result {
                case .success(let newsArticles):
                    DispatchQueue.main.async {
                        self.newsArticles = newsArticles.map(NewsArticleViewModel.init)
                    }
                case .failure(let error):
                    print(error)
                }
        }
    }
    
}
