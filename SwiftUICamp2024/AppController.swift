//
//  AppController.swift
//  SwiftUICamp2024
//
//  Created by Isaac Martínez on 16-10-24.
//

import SwiftUI

@Observable
class AppController {
  var profile = Profile()
  
  func changeToAda(){
    profile = APIService.fetchPerson()
  }
  
  // MARK: - Firestore
  var profiles: [Profile] = []
  
  func createProfile(_ profile: Profile) throws {
    try APIService.createProfile(profile)
  }
  
  func fetchProfiles() async throws {
    profiles = try await APIService.fetchProfiles()
  }
}
