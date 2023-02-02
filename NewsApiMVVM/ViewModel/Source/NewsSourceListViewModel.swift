//
//  NewsSourceListViewModel.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 02/02/2023.
//

import Foundation

class NewsSourceListViewModel: ObservableObject {
    
    @Published var newsSources: [NewsSourceViewModel] = []
    
    func getSources() {
        WebService().fetchSources(
            url: Constants.Urls.sources) { result in
                switch result {
                    case .success(let newsSources):
                        DispatchQueue.main.async {
                            self.newsSources = newsSources.map(NewsSourceViewModel.init)
                        }
                    case .failure(let error):
                        print(error)
                    }
            }
    }
}
