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
    
    @Published var quoteDay:Quote!
    
    func loadData() {
        db.collection("quotes").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
              print("No documents")
              return
            }
            
            self.quotes = documents.compactMap { queryDocumentSnapshot -> Quote? in
                return try? queryDocumentSnapshot.data(as: Quote.self)
            }
            
            print(self.quotes)
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
//    func quoteOfTheDay() {
//        let daysSince1970 = NSDate().timeIntervalSince1970 / 60 / 60 / 24
//        let index = Int(daysSince1970) % self.quotes.count
//        self.quoteDay = self.quotes[index]
//    }
}
