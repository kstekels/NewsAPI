//
//  ContentView.swift
//  NewsApiMVVM
//
//  Created by karlis.stekels on 02/02/2023.
//

import SwiftUI

struct NewsSourceListScreen: View {
    
    @StateObject private var newsSourceListViewModel = NewsSourceListViewModel()
    
    var body: some View {
        
        NavigationView {
        
        List(newsSourceListViewModel.newsSources, id: \.id) { newsSource in
            NavigationLink(destination: NewsListScreen(newsSource: newsSource)) {
                NewsSourceCell(newsSource: newsSource)
            }
        }
        .listStyle(.plain)
//        .onAppear {
//            newsSourceListViewModel.getSources()
//        }
        .task {
            await newsSourceListViewModel.getSourcesWithAsync()
        }
        .navigationTitle("News Sources")
        .navigationBarItems(trailing: Button(action: {
            Task {
                await newsSourceListViewModel.getSourcesWithAsync()
            }
        }, label: {
            Image(systemName: "arrow.clockwise.circle")
        }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsSourceListScreen()
    }
}
