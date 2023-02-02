//
//  Helper.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 02/02/2023.
//

import Foundation

func getApiKey(for key: String) -> String {
    if let apiKey = ProcessInfo.processInfo.environment[key] {
        return apiKey
    }
    return ""
}
