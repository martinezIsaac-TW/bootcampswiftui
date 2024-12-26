//
//  MyTextField.swift
//  SwiftUICamp2024
//
//  Created by Isaac Martínez on 16-10-24.
//

import SwiftUI

struct MyTextField: View {
  @Binding var name: String
  
  var body: some View {
    TextField("Ingresa tu nombre", text: $name)
      .textFieldStyle(.roundedBorder)
  }
}
