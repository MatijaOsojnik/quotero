//
//  QuotesViewModel.swift
//  quotero
//
//  Created by Matija Osojnik on 02/01/2021.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class QuotesViewModel: ObservableObject {
    private var db = FirebaseFirestore.Firestore.firestore()
    
    @Published var quotes = [Quote]()
    
    func loadData() {
        db.collection("quotes").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
              print("No documents")
              return
            }
            
            self.quotes = documents.compactMap { queryDocumentSnapshot -> Quote? in
                
                return try? queryDocumentSnapshot.data(as: Quote.self)
            }
//                    let data = queryDocumentSnapshot.data()
//
//                    let body = data["body"] as? String ?? ""
//                    let author = data["author"] as? String ?? ""
//
//                return Quote(id: .init(), body: body, author: author)
                  
//            self.quotes.map {
//                quote in
//                print(quote.id as Any)
//            }
      }
    }
}
