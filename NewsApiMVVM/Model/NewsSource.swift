//
//  NewsSource.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 02/02/2023.
//

import Foundation

struct NewsSource: Decodable {
    let id: String
    let name: String
    let description: String
}
