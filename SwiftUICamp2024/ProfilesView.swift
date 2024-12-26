//
//  ProfilesViews.swift
//  SwiftUICamp2024
//
//  Created by Isaac Martínez on 09-12-24.
//

import SwiftUI

struct ProfilesView: View {
  
  @Environment(AppController.self) private var appController
  
  var body: some View {
    List {
      ForEach(appController.profiles, id: \.self.name) { profile in
          Text(profile.name)
      }
    }
    .toolbar {
      ToolbarItem(placement: .primaryAction){
        Button {
          createProfile()
        } label: {
          Image(systemName: "plus")
        }
      }
    }
    .onAppear {
      Task {
        do {
          try await appController.fetchProfiles()
        } catch {
          print(error.localizedDescription)
        }
      }
    }
  }
   // MARK: - Actions
  
  func createProfile() {
    Task {
      do {
        let profile = Profile(name: "New Profile")
        try appController.createProfile(profile)
        try await appController.fetchProfiles()
      } catch {
        print(error.localizedDescription)
      }
    }
  }
}

#Preview {
    ProfilesView()
}
