//
//  ContentView.swift
//  SwiftUICamp2024
//
//  Created by Isaac Martínez on 16-10-24.
//

import SwiftUI

struct ContentView: View {
  //@State private var name = ""
  
  @State private var viewModel = ContentViewModel()
  @Environment(AppController.self) private var appController
  @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
  
    var body: some View {
      @Bindable var appController = appController
        VStack {
          Text(appController.profile.name) //name es una ruta al estado de una via
          MyTextField(name: $appController.profile.name) //$name es una ruta de ida y vuelta
          Button("Login") {
            viewModel.login()
          }
        }
        .padding()
        .onChange(of: viewModel.isLoggedIn) { _, isLoggedIn in
          if isLoggedIn {
            appController.profile.name = "Ada"
          }
        }
    }
}

#Preview {
    ContentView()
    .environment(AppController())
}

@Observable
fileprivate class ContentViewModel {
  var isLoggedIn = false
  func login() {
    isLoggedIn = true
  }
}
