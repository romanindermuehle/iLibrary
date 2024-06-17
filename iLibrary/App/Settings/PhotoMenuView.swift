//
//  PhotoMenu.swift
//  iLibrary
//
//  Created by Roman Indermühle on 15.06.2024.
//

import SwiftUI
import PhotosUI

struct PhotoMenuView: View {
    @Binding var selectedPhoto: PhotosPickerItem?
    @Bindable var user: User
    
    @Environment(\.dismiss) var dismiss
    
    var splitViewVisibility: NavigationSplitViewVisibility?
    
    var screenWidth: Int? {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return Int(windowScene.coordinateSpace.bounds.width) - (splitViewVisibility == .detailOnly ? 0: 100)
        }
        return nil
    }
    
    var body: some View {
        VStack {
            Text("Photo")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
            
            Spacer()
            
            VStack(spacing: 12) {
                PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
                    Label("Photo library", systemImage: "photo.on.rectangle.angled")
                }
                .frame(width: CGFloat(screenWidth ?? 0), height: 50)
                .background(Color(.systemGray6))
                .clipShape(Capsule())
   
                Button(role: .destructive) {
                    selectedPhoto = nil
                    user.image = nil
                } label: {
                    Label("Remove photo", systemImage: "trash")
                }
                .frame(width: CGFloat(screenWidth ?? 0), height: 50)
                .background(Color(.systemGray6))
                .clipShape(Capsule())
                .disabled(user.image == nil)
                
                Button {
                    dismiss()
                } label: {
                    
                    Text("Close")
                        .frame(width: CGFloat(screenWidth ?? 0), height: 50)
        #if (os(iOS))
                        .fontWeight(.semibold)
                        .background(.accent)
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                        .padding(.top)
        #endif
                }
            }
        }
    }
}

