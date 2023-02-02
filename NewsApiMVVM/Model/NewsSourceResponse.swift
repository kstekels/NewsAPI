//
//  NewsSourceResponse.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 02/02/2023.
//

import Foundation

struct NewsSourceResponse: Decodable {
    let sources: [NewsSource]
}
