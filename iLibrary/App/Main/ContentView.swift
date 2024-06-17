//
//  ContentView.swift
//  iLibrary
//
//  Created by Roman Indermühle on 15.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem { Label("Discover", systemImage: "books.vertical") }
            ArticleListView()
                .tabItem { Label("Your Articles", systemImage: "lock.rectangle.stack.fill") }
        }
    }
}

#Preview {
    ContentView()
}
