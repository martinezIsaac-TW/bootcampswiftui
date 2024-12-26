//
//  APIService.swift
//  SwiftUICamp2024
//
//  Created by Isaac Martínez on 07-12-24.
//

import SwiftUI
import FirebaseFirestore

struct APIService {
  static func fetchPerson() -> Profile {
    .init(name: "Ada")
  }
  
  static func createProfile(_ profile: Profile) throws {
    let reference = Firestore.firestore().collection("profiles").document()
    try reference.setData(from: profile)
  }
  
  static func fetchProfiles() async throws -> [Profile] {
    let reference = Firestore.firestore().collection("profiles")
    let snapshot = try await reference.getDocuments()
    
    let documents = snapshot.documents.compactMap { snapshot in
      try? snapshot.data(as: Profile.self)
    }
    
    return documents
  }
}
