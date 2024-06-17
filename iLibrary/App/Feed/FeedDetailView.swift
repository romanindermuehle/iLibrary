//
//  FeedDetailView.swift
//  iLibrary
//
//  Created by Roman Indermühle on 15.06.2024.
//

import SwiftUI

struct FeedDetailView: View {
    let article: PublicArticle
    
    var body: some View {
        Form {
            Section {
                Text(article.title)
                    .font(.title)
                    .fontWeight(.bold)
                Text(article.subTitle)
                    .font(.headline)
                Text(article.createdAt.formatted(date: .complete, time: .shortened))
            }
            .listRowSeparator(.hidden)
            
            Section("Text") {
                Text(article.text)
            }
            
            Section("Image") {
                AsyncImage(url: URL(string: article.imageURL)) { image in
                    image.image?.resizable()
                }
                .frame(width: 350, height: 250)
            }
        }
    }
}

