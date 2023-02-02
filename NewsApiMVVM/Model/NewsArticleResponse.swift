//
//  NewsArticleResponse.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 02/02/2023.
//

import Foundation

struct NewsArticleResponse: Decodable {
    let articles: [NewsArticle]
}
