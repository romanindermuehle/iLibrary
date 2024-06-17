//
//  WelcomeHeader.swift
//
//
//  Created by Roman Indermühle on 28.01.2024.
//

import SwiftUI

struct WelcomeHeader: View {
    var body: some View {
        VStack {
            Text("Welcome to")
            Text("iLibrary")
                .foregroundStyle(.accent)
        }
        .font(.system(size: 36))
        .fontWeight(.black)
    }
}


