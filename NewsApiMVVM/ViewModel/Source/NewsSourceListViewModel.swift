//
//  NewsSourceListViewModel.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 02/02/2023.
//

import Foundation

class NewsSourceListViewModel: ObservableObject {
    
    @Published var newsSources: [NewsSourceViewModel] = []
    
    /*
    func getSources() {
        // With completion handler
        
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
     */
    
    func getSourcesWithAsync() async {
        do {
            let newsSources = try await WebServiceAsync().fetchSourcesAsync(url: Constants.Urls.sources)
            DispatchQueue.main.async {
                self.newsSources = newsSources.map(NewsSourceViewModel.init)
            }
        } catch {
            print(error)
        }
    }
}
