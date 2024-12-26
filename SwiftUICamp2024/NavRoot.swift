//
//  NavRoot.swift
//  SwiftUICamp2024
//
//  Created by Isaac Martínez on 19-12-24.
//

import SwiftUI

@Observable
class Navigation {
  var stack = NavigationPath()
}

enum Destination: Hashable, View {
  case view1
  case view2(title: String)
  case view3
  
  var body: some View {
    switch self {
    case .view1:
      MyView1()
    case .view2(let title):
      MyView2(title: title)
    case .view3:
      MyView3()
    }
  }
}

struct NavRoot: View {
  
  @State private var navigation: Navigation = .init()
    var body: some View {
      NavigationStack(path: $navigation.stack) {
        MyView1()
          .navigationDestination(for: Destination.self) { $0 }
      }
      .environment(navigation)
    }
}

#Preview {
    NavRoot()
}

struct MyView1: View {
  
  @Environment(Navigation.self) private var navigation
  
  @State private var isPresented: Bool = false
  
  @State private var names: [String] = ["Alex", "Jhon", "Jane"]
  
  @State private var selectedNames: String?
  
  var body: some View {
    List {
      Text("Hello, World1")
      /*
      NavigationLink{
        MyView2()
      } label: {
        Text("Go to view2")
      }
      Button("Go to View2"){
        navigation.stack.append(Destination.view2(title: "View 2"))
      }
      NavigationLink(value: Destination.view2(title: "view 2 y wea")){
        Text("goto view2 y wea")
      }
      Button("View 2"){
        isPresented.toggle()
      }
       */
      ForEach(names, id: \.self) { name in
        Button(name) {
          selectedNames = name
        }
      }
    }
    .navigationDestination(isPresented: $isPresented){
      MyView2(title: "2")
    }
    .navigationTitle("MyView1")
    .navigationBarTitleDisplayMode(.inline)
    .navigationDestination(item: $selectedNames) {name in
      MyView2(title: name)
    }
  }
}
struct MyView2: View {
  
  let title: String
  
  @Environment(Navigation.self) private var navigation
  @Environment(\.dismiss) private var dismiss
  
  var body: some View {
    VStack {
      Text("Hello, World2")
      /*
      Button("Go to View3"){
        navigation.stack.append(Destination.view3)
      }
       */
      NavigationLink(value: Destination.view3) {
        Text("Go to view3")
      }
    }
    .navigationTitle(title)
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarBackButtonHidden()
    .toolbar {
      ToolbarItem(placement: .cancellationAction) {
        Button("Back") {
          dismiss()
        }
      }
    }
  }
}
struct MyView3: View {
  @Environment(Navigation.self) private var navigation
  var body: some View {
    VStack {
      Text("Hello, worl")
      Button("Pop to root") {
        navigation.stack.removeLast(navigation.stack.count)
      }
    }
  }
}
