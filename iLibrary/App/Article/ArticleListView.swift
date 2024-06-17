//
//  ArticleListView.swift
//  iLibrary
//
//  Created by Roman Indermühle on 15.06.2024.
//

import SwiftUI
import SwiftData

struct ArticleListView: View {
    @Query var articles: [Article]
    @Environment(\.modelContext) var context
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(articles, id: \.self) { article in
                    NavigationLink(value: article) {
                        VStack(alignment: .leading) {
                            Text(article.title)
                            Text(article.createdAt.formatted(date: .abbreviated, time: .omitted))
                        }
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            context.delete(article)
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
            .navigationTitle("My Private Library")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(value: true) {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: Bool.self) { _ in
                ArticleModifyView(article: .constant(nil), title: "", subTitle: "", text: "", imageURL: "", isEditing: false)
            }
            .navigationDestination(for: Article.self) { article in
                ArticleModifyView(article: .constant(article), title: article.title, subTitle: article.subTitle, text: article.text, imageURL: article.imageURL, isEditing: true)
            }
        }
    }
}

