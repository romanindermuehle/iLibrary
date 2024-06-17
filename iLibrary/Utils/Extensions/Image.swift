//
//  Image.swift
//  iLibrary
//
//  Created by Roman Indermühle on 15.06.2024.
//

import SwiftUI

extension Image {
    init?(data: Data) {
        guard let image = UIImage(data: data) else { return nil }
        self = .init(uiImage: image)
    }
}
