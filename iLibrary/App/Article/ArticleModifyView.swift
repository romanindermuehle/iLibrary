//
//  PrivateLibraryModifyView.swift
//  iLibrary
//
//  Created by Roman Indermühle on 15.06.2024.
//

import SwiftUI
import SwiftData

struct ArticleModifyView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @Binding var article: Article?
    
    @State var title: String
    @State var subTitle: String
    @State var text: String
    @State var imageURL: String
    
    let isEditing: Bool
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                TextField("SubTitle", text: $subTitle)
                TextField("ImageURl", text: $imageURL)
            }
            Section("Text") {
                TextEditor(text: $text)
            }
            Section("Image preview") {
                AsyncImage(url: URL(string: imageURL)) { image in
                    image.image?.resizable()
                }
                .frame(width: 350, height: 250)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    saveArticle()
                    dismiss()
                }
            }
        }
    }
    
    func saveArticle() {
        if isEditing {
            article?.title = title
            article?.subTitle = subTitle
            article?.text = text
            article?.imageURL = imageURL
        } else {
            let article = Article(title: title, subTitle: subTitle, text: text, imageURL: imageURL)
            context.insert(article)
        }
    }
}

