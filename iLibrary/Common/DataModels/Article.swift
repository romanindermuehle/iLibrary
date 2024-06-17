//
//  Article.swift
//  iLibrary
//
//  Created by Roman Indermühle on 15.06.2024.
//

import Foundation
import SwiftData

@Model
class Article {
    var title: String = "Title"
    var subTitle: String = "SubTitle"
    var text: String = "Text"
    var imageURL: String = "ImageURL"
    var createdAt: Date = Date.now
    
    init(title: String, subTitle: String, text: String, imageURL: String, createdAt: Date = .now) {
        self.title = title
        self.subTitle = subTitle
        self.text = text
        self.imageURL = imageURL
        self.createdAt = createdAt
    }
}
