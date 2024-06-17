//
//  PublicLibraryView.swift
//  iLibrary
//
//  Created by Roman Indermühle on 15.06.2024.
//

import SwiftUI
import SwiftData

struct FeedView: View {
    @Query(sort: \User.createdAt) var users: [User]
    @State private var isSettingsShowing: Bool = false
    
    @State private var cloudKitManager = CloudKitManager()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    if let user = users.first {
                        Text("Hello \(user.name),")
                    } else {
                        Text("Hello Anonymous,")
                    }
                    Text("Here are all your articles:")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                List {
                    ForEach(cloudKitManager.publicArticles, id: \.self) { article in
                        NavigationLink(value: article) {
                            VStack(alignment: .leading) {
                                Text(article.title)
                                    .font(.headline)
                                Text(article.subTitle)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .background(Color(UIColor.systemGroupedBackground))
            .padding(.top, 20)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        isSettingsShowing.toggle()
                    } label: {
                        if let selectedPhotoData = users.first?.image {
                            Image.init(data: selectedPhotoData)?
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.accent)
                                .frame(width: 45, height: 45)
                            
                        }
                    }
#if (os(visionOS))
                    .buttonBorderShape(.circle)
#endif
                }
            }
            .background(Color(UIColor.systemGroupedBackground))
            .sheet(isPresented: $isSettingsShowing) {
                NavigationStack {
                    SettingsView()
                }
            }
            .navigationDestination(for: PublicArticle.self) { article in
                FeedDetailView(article: article)
            }
        }
        .onAppear {
            cloudKitManager.fetchArticles()
        }
    }
}


#Preview {
    FeedView()
}
