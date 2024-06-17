//
//  WelcomeView.swift
//
//
//  Created by Roman Indermühle on 17.01.2024.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var currentTab: Int
    
    var body: some View {
        VStack(alignment: .center) {
            
            WelcomeHeader()
                .padding()
            
            Text("We're here to help you build your own collection of personal articles or get inspired by what others have done.")
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            InformationContainerView()
                .padding(.bottom)
            
            Spacer()
            
            Button {
                currentTab += 1
            } label: {
                Text("Continue")
                    .frame(width: 250, height: 50)
#if (os(iOS))
                    .fontWeight(.semibold)
                    .background(.accent)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
#endif
            }
            
            Spacer()
            
            
        }
        .padding()
    }
}


