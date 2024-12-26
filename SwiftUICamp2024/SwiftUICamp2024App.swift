//
//  SwiftUICamp2024App.swift
//  SwiftUICamp2024
//
//  Created by Isaac Martínez on 16-10-24.
//

import SwiftUI

@main
struct SwiftUICamp2024App: App {
  
  @State private var appController = AppController()
  
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  var body: some Scene {
    WindowGroup {
      /*
      NavigationStack {
        ProfilesView()
      }
      .environment(appController)
      */
      NavRoot()
    }
  }
}
