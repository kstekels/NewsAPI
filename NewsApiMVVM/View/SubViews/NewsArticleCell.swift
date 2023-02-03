//
//  NewsArticleCell.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 02/02/2023.
//

import SwiftUI

struct NewsArticleCell: View {
    
    let newsArticle: NewsArticleViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: newsArticle.urlToImage) { image in
                image.resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
            } placeholder: {
                ProgressView("Loading...")
                    .frame(maxWidth: 100, maxHeight: 100)
            }
            
            VStack {
                Text(newsArticle.title)
                    .fontWeight(.bold)
                Text(newsArticle.description)
            }
        }.onAppear {
            print(newsArticle)
        }
    }
}

