//
//  LikeService.swift
//  quotero
//
//  Created by Matija Osojnik on 03/01/2021.
//

import Foundation
import Combine
import FirebaseAuth
import Firebase
import FirebaseFirestore


class LikeService: ObservableObject {
  
    private var uid: String
    
    final var db = FirebaseFirestore.Firestore.firestore()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.uid = Auth.auth().currentUser?.uid ?? "unknown"
//        self.userId = AuthenticationService().$user.compactMap {
//            user in
//            user?.uid
//        }.assign(to: \.userId, on: self)
//        .store(in: &cancellables)
//
//        AuthenticationService().$user // (6)
//          .receive(on: DispatchQueue.main) // (7)
//          .sink { user in
//            self.likedPosts() // (8)
//          }
//          .store(in: &cancellables)
    }
  
  func likeQuote() {
    print(self.uid)
    postLike()
  }
    
    func unlikeQuote() {
        deleteLike()
    }
    
    func likedPosts() {
        
    }
    
    
  
  private func postLike() {
    db.collection("quoteLikes").document()
  }
    
    private func deleteLike() {
        
    }
  
}
