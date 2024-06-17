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
    var publicArticles: [PublicArticle] = []
    
    private var publicDatabase: CKDatabase
    
    init(publicDatabase: CKDatabase = CKContainer.default().publicCloudDatabase) {
        self.publicDatabase = CKContainer.default().publicCloudDatabase
    }
    
    func fetchArticles() {
            let predicate = NSPredicate(value: true)
            let query = CKQuery(recordType: "PublicArticle", predicate: predicate)
            
            publicDatabase.fetch(withQuery: query) { [weak self] result in
                switch result {
                case .success(let (matchResults, _)):
                    var fetchedRecords: [PublicArticle] = []
                    
                    for (recordID, recordResult) in matchResults {
                        switch recordResult {
                        case .success(let record):
                            fetchedRecords.append(PublicArticle(record: record))
                        case .failure(let error):
                            print("Error fetching record with ID \(recordID): \(error.localizedDescription)")
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self?.publicArticles = fetchedRecords
                    }
                    
                case .failure(let error):
                    print("Error fetching records: \(error.localizedDescription)")
                }
            }
        }
}
