//
//  NetworkError.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 02/02/2023.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidData
    case decodedError
}
