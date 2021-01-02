//
//  QuoteRepository.swift
//  quotero
//
//  Created by Matija Osojnik on 01/01/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestore


class QuoteRepository: ObservableObject {
    private var db = FirebaseFirestore.Firestore.firestore()
    
    @Published var quotes = [Quote]()
    
    func loadData() {
        db.collection("quotes").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
              print("No documents")
              return
            }
            
            self.quotes = documents.map { queryDocumentSnapshot -> Quote in
                    let data = queryDocumentSnapshot.data()
                    let body = data["body"] as? String ?? ""
                    let author = data["author"] as? String ?? ""

                    return Quote(id: .init(), body: body, author: author)
                  }
      }
    }
}
