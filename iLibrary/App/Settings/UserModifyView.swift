//
//  UserModifyView.swift
//  iLibrary
//
//  Created by Roman Indermühle on 15.06.2024.
//

import SwiftUI
import PhotosUI

struct UserModifyView: View {
    @Bindable var user: User
    
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var isPhotoMenuShowing: Bool = false
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 8) {
                if let selectedPhotoData = user.image {
                    Image.init(data: selectedPhotoData)?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 225, height: 225)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.accent)
                        .frame(width: 105, height: 105)
                }
                
                Button("Change photo") {
                    isPhotoMenuShowing.toggle()
                }
                
//                Menu {
//                    PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
//                        Label("Photo library", systemImage: "photo.on.rectangle.angled")
//                    }
//                    Button(action: {
//                                   isShowingPhotoPicker = true
//                               }) {
//                                   Text("Change photo2")
//                                       .foregroundColor(.orange)
//                               }
//                    Button(role: .destructive) {
//                        selectedPhoto = nil
//                        user.image = nil
//                    } label: {
//                        Label("Remove photo", systemImage: "trash")
//                            .foregroundStyle(.red)
//                    }
//                    .disabled(user.image == nil)
//                } label: {
//                    Text("Change photo")
//                }
        
                
                Text("Created at \(user.createdAt, style: .date)")
                    .font(.caption)
            }
            
            TextField("Your name", text: $user.name)
                .textFieldStyle(.roundedBorder)
                .padding(.top, 20)
            
            Spacer()
        }
        .padding()
        .task(id: selectedPhoto) {
              if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                  user.image = data
              }
          }
        .sheet(isPresented: $isPhotoMenuShowing) {
            PhotoMenuView(selectedPhoto: $selectedPhoto, user: user)
                .presentationDetents([.height(250)])
                .presentationCornerRadius(45)
        }
    }
}
