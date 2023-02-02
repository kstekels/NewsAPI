//
//  NewsSourceCell.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 02/02/2023.
//

import SwiftUI

struct NewsSourceCell: View {
    
    let newsSource: NewsSourceViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(newsSource.name)
                .font(.headline)
            Text(newsSource.description)
        }
    }
}

