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
    
    @Published var quoteDay = [Quote]()
    
    func loadData() {
        db.collection("quotes").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
              print("No documents")
              return
            }
            
            self.quotes = documents.compactMap { queryDocumentSnapshot -> Quote? in
                return try? queryDocumentSnapshot.data(as: Quote.self)
            }
      }
    }
    
    func loadSingle() {
        db.collection("quotes").whereField("featured", isEqualTo: true).getDocuments() {
            (snapshot, err) in
                guard let documents = snapshot?.documents else {
                  print("No documents")
                  return
                }
                self.quoteDay = documents.compactMap { queryDocumentSnapshot -> Quote? in
                    return try? queryDocumentSnapshot.data(as: Quote.self)
                }
        }
     }
//    func quoteOfTheDay() {
//        let daysSince1970 = NSDate().timeIntervalSince1970 / 60 / 60 / 24
//        let index = Int(daysSince1970) % self.quotes.count
//        self.quoteDay = self.quotes[index]
//    }
}
