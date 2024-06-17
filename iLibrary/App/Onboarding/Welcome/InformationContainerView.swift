//
//  InformationContainerView.swift
//
//
//  Created by Roman Indermühle on 28.01.2024.
//

import SwiftUI

struct InformationContainerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            InformationDetailView(
                title: "Create your personal library",
                subTitle: "Start to create your own personal library",
                imageName: "mail.stack.fill"
            )
            InformationDetailView(
                title: "Privacy",
                subTitle: "Build with privcy in mind",
                imageName: "lock.icloud.fill"
            )
            InformationDetailView(
                title: "Get inspired",
                subTitle: "Get inspired by others",
                imageName: "sparkles"
            )
        }
        .padding(.horizontal)
    }
}


