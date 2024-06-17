//
//  User.swift
//  iLibrary
//
//  Created by Roman Indermühle on 15.06.2024.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String = "Anonymous"
    @Attribute(.externalStorage) var image: Data?
    var createdAt: Date = Date.now
    
    init(name: String, image: Data?, createdAt: Date = .now) {
        self.name = name
        self.image = image
        self.createdAt = createdAt
    }
}
