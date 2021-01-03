//
//  LikeService.swift
//  quotero
//
//  Created by Matija Osojnik on 03/01/2021.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift


class LikeService: ObservableObject {
    
    @Published var quotes = [Quote]()
  
    private var uid: String
    
    private var db = FirebaseFirestore.Firestore.firestore()
    
    init() {
        self.uid = Auth.auth().currentUser?.uid ?? "unknown"
//
//        AuthenticationService().$user // (6)
//          .receive(on: DispatchQueue.main) // (7)
//          .sink { user in
//            self.likedPosts() // (8)
//          }
//          .store(in: &cancellables)
    }
  
    func likeQuote(quote: Quote) {
    print(self.uid)
        postLike(quote: quote)
  }
    
    func unlikeQuote(quote: Quote) {
        deleteLike(quote: quote)
    }
    
    func loadData() {
        db.collection("quoteLikes").document(self.uid)
        .collection("quotes").addSnapshotListener { documentSnapshot, error in
            guard let documents = documentSnapshot?.documents else {
              print("Error fetching document: \(error!)")
              return
            }
            
            self.quotes = documents.compactMap { queryDocumentSnapshot in
                
                return try? queryDocumentSnapshot.data(as: Quote.self)
            }
          }
    }
    
    func isliked (quote: Quote, completion: @escaping (Bool) -> Void){
        let quoteId = db.collection("quotes").document((quote.id as String?)!).documentID
        db.collection("quoteLikes").document(self.uid)
        .collection("quotes")
            .addSnapshotListener { documentSnapshot, error in
            guard let documents = documentSnapshot?.documents else {
              print("Error fetching document: \(error!)")
              return
            }
                for i in 0 ..< documents.count {
                    if documents[i].documentID == quoteId {
                            completion(true)
                        return
                        }
                }
            completion(false)
            }
        }
    
    
  
    private func postLike(quote: Quote) {
        db.collection("quoteLikes").document(self.uid).collection("quotes").document(quote.id!)
        .setData([
            "body": quote.body,
            "author": quote.author
    ])
  }
    
    private func deleteLike(quote: Quote) {
        db.collection("quoteLikes").document(self.uid).collection("quotes").document(quote.id!).delete()
    }
  
}
