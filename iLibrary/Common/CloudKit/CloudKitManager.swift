//
//  CloudKitManager.swift
//  iLibrary
//
//  Created by Roman Indermühle on 15.06.2024.
//

import Foundation
import CloudKit

@Observable
class CloudKitManager {
    private var publicDatabase: CKDatabase
    
    init(publicDatabase: CKDatabase = CKContainer.default().publicCloudDatabase) {
        self.publicDatabase = publicDatabase
    }
    
    func fetchArticles() async throws -> [PublicArticle] {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "PublicArticle", predicate: predicate)
        
        return try await withCheckedThrowingContinuation { continuation in
            publicDatabase.fetch(withQuery: query) { result in
                switch result {
                case .success(let (matchResults, _)):
                    var fetchedRecords: [PublicArticle] = []
                    
                    for (_, recordResult) in matchResults {
                        switch recordResult {
                        case .success(let record):
                            fetchedRecords.append(PublicArticle(record: record))
                        case .failure(let error):
                            continuation.resume(throwing: error)
                            return
                        }
                    }
                    
                    continuation.resume(returning: fetchedRecords)
                    
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
