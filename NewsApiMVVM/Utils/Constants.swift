//
//  Constants.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 02/02/2023.
//

import Foundation


struct Constants {
    struct Urls {
        static func topHeadlines(by source: String) -> URL? {
            return URL(string: "https://newsapi.org/v2/top-headlines?sources=\(source)&apiKey=\(getApiKey(for: "API_KEY"))")
        }
        
        static let sources: URL? = URL(string: "https://newsapi.org/v2/sources?apiKey=\(getApiKey(for: "API_KEY"))")
        
        static let imagePlaceholder: String = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"
    }
    
    
}
