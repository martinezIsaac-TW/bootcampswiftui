//
//  DetailView.swift
//  SwiftUICamp2024
//
//  Created by Isaac Martínez on 16-10-24.
//

import SwiftUI

struct DetailView: View {
  
  @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
  
  var body: some View {
    Text("Hello, DetailView!")
  }
}

#Preview {
  DetailView()
}
