//
//  LikeService.swift
//  quotero
//
//  Created by Matija Osojnik on 03/01/2021.
//

import Foundation
import Firebase
import FirebaseFirestore


class LikeService: ObservableObject {
  
  @Published var user: User?
    
    final var db = FirebaseFirestore.Firestore.firestore()
  
  func likeQuote() {
    postLike()
  }
    
    func unlikeQuote() {
        deleteLike()
    }
    
    
  
  private func postLike() {
    Auth.auth().addStateDidChangeListener { (auth, user) in // (4)
      print("Sign in state has changed.")
      self.user = user
      
      if let user = user {
        let anonymous = user.isAnonymous ? "anonymously " : ""
        print("User signed in \(anonymous)with user ID \(user.uid).")
      }
      else {
        print("User signed out.")
      }
    }
  }
    
    private func deleteLike() {
        
    }
  
}
