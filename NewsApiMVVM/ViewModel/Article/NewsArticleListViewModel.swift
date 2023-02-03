//
//  NewsArticleListViewModel.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 02/02/2023.
//

import Foundation

class NewsArticleListViewModel: ObservableObject {
    
    @Published var newsArticles = [NewsArticleViewModel]()
    
    
    /*
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
     */
    
    
    // Async
    /*
     func getNewsAsyncBy(sourceId: String) async {
         do {
             let newsArticles = try await WebServiceAsync().fetchNewsAsync(url: Constants.Urls.topHeadlines(by: sourceId))
             DispatchQueue.main.async {
                 self.newsArticles = newsArticles.map(NewsArticleViewModel.init)
             }
         } catch {
             print(error)
         }
     }
     */
    
    //Async with 3rd party, when not accessible directly
    @MainActor
    func getNewsAsyncBy3rdParty(sourceId: String) async {
        do {
            let newsArticles = try await WebService().fetchNewsAsync(sourceId: sourceId, url: Constants.Urls.topHeadlines(by: sourceId))
            self.newsArticles = newsArticles.map(NewsArticleViewModel.init)
            
            /*
             // Without @MainActor
          DispatchQueue.main.async {
                self.newsArticles = newsArticles.map(NewsArticleViewModel.init)
             }*/
            
            
        } catch {
            print(error)
        }
    }
    
    
}
