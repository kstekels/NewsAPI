//
//  NewsListScreen.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 02/02/2023.
//

import SwiftUI

struct NewsListScreen: View {
    
    let newsSource: NewsSourceViewModel
    @StateObject private var newsArticleListViewModel = NewsArticleListViewModel()
    

    var body: some View {
        
        NavigationView {
        
        List(newsArticleListViewModel.newsArticles, id: \.id) { newsArticle in
                NewsArticleCell(newsArticle: newsArticle)
        }
        .listStyle(.plain)
        .onAppear {
            newsArticleListViewModel.getNewsBy(sourceId: newsSource.id)
        }
        .navigationTitle(newsSource.name)
        }
    }
}

struct NewsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsListScreen(newsSource: NewsSourceViewModel.default)
    }
}
