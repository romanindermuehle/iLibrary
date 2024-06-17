//
//  CreateUserView.swift
//  iLibrary
//
//  Created by Roman Indermühle on 15.06.2024.
//

import SwiftUI
import SwiftData

struct CreateUserView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    @State private var name: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("Hey, what is your name?")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
                
                Text("Type the name you would like to be called.")
                
            }
            
            HStack {
                TextField("Your name", text: $name)
                    .textFieldStyle(.roundedBorder)
                Button {
                    createUser()
                    
                    if isOnboarding {
                        finishOnboarding()
                    } else {
                        dismiss()
                    }
                    
                    
                } label: {
                    Image(systemName: "arrow.right")
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white)
#if (os(iOS))
                        .background(.accent)
#endif
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
        }
        .padding()
    }
    
    func createUser() {
        let user = User(name: name, image: nil)
        context.insert(user)
    }
    
    func finishOnboarding() {
        isOnboarding = false
    }
}

