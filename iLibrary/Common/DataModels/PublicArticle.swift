//
//  PublicArticle.swift
//  iLibrary
//
//  Created by Roman Indermühle on 15.06.2024.
//

import Foundation
import CloudKit

struct PublicArticle: Identifiable, Hashable {
    var id: CKRecord.ID
    var title: String
    var subTitle: String
    var text: String
    var imageURL: String
    var createdAt: Date
    
    init(record: CKRecord) {
        self.id = record.recordID
        self.title = record["title"] as? String ?? "No title"
        self.subTitle = record["subTitle"] as? String ?? "No subTitle"
        self.text = record["text"] as? String ?? "No text"
        self.imageURL = record["imageURL"] as? String ?? "No imageURL"
        self.createdAt = record["createdAt"] as? Date ?? .now
    }
}
