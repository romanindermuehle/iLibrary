//
//  SettingsView.swift
//  iLibrary
//
//  Created by Roman Indermühle on 15.06.2024.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    @Query(sort: \User.createdAt) var users: [User]
    @Environment(\.dismiss) var dismiss
    
    @State private var isCreateUserSheetShowing: Bool = false
    
    var body: some View {
        Form {
            if let user = users.first {
                Section {
                    VStack(spacing: 8) {
                        if let selectedPhotoData = users.first?.image {
                            Image.init(data: selectedPhotoData)?
                                .resizable()
                                .scaledToFill()
                                .frame(width: 145, height: 145)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.accent)
                                .frame(width: 145, height: 145)
                        }
                        
                        Text(user.name)
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Text("Created at \(user.createdAt, style: .date)")
                            .font(.caption)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                
                Section {
                    NavigationLink(destination: UserModifyView(user: user)) {
                        Label("Personal data", systemImage: "person.crop.circle")
                    }
                }
            } else {
                Section {
                    Button {
                        isCreateUserSheetShowing.toggle()
                    } label: {
                        Label("Create user", systemImage: "person.crop.circle.fill.badge.plus")
                    }
                }
            }
            Section {
                Label("Report a bug", systemImage: "exclamationmark.bubble.fill")
                Label("Share your feedback", systemImage: "bubble.left.and.bubble.right.fill")
                Label("Rate iLibrary in the AppStore", systemImage: "storefront.fill")
            }
            
            Section {
                Label("About iLibrary", systemImage: "info.circle.fill")
                Label("Privacy Policy", systemImage: "lock.shield.fill")
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Close") {
                    dismiss()
                }
            }
        }
        
        .fullScreenCover(isPresented: $isCreateUserSheetShowing) {
            CreateUserView()
        }
    }
}
