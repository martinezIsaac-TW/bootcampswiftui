//
//  MainView.swift
//  SwiftUICamp2024
//
//  Created by Isaac Martínez on 11-12-24.
//

import SwiftUI

struct ColorItem: Identifiable {
  let id = UUID().uuidString
  let color: Color
}

struct MainView: View {
  
  @ScaledMetric var spacingSize: CGFloat = 10
  @State private var colors: [ColorItem] = [
    .init(color: .red),
    .init(color: .blue),
    .init(color: .green),
    .init(color: .yellow),
    .init(color: .orange),
    .init(color: .purple)
  ]
  
  @State private var gridItems = [GridItem(spacing: 0)/*, GridItem(spacing: 0), GridItem(spacing: 0)*/]
  
  @State private var scrollPosition = ScrollPosition()
  
    var body: some View {
//      ScrollViewReader { scrollViewProxy in
        VStack {
          /*
          Button("scroll to") {
            withAnimation {
//              scrollViewProxy.scrollTo(Color.orange, anchor: .leading)
                scrollPosition.scrollTo(id: Color.orange, anchor: .leading)
            }
          }
          GeometryReader { proxy in
            ScrollView(.horizontal) {
              LazyHGrid(rows: gridItems, spacing: 0, pinnedViews: [.sectionFooters, .sectionHeaders]) {
                ForEach(colors) { colorItem in
                  cell(colorItem, proxy: proxy, gridItems: gridItems)
                    .id(colorItem.color)
                    .onScrollVisibilityChange(threshold: 0.1, {
                      visible in
                      print("\(colorItem.color.description) is \(visible ? "visible" : "not visible")")
                    })
                }
              }
            }
            .scrollPosition($scrollPosition)
            .scrollIndicators(.hidden)
            .onScrollPhaseChange { oldPhase, newPhase, context in
              print(context.geometry.contentOffset.x)
            }
//          }
////        }
           */
          List {
            ForEach(colors) { colorItem in
              Text(colorItem.color.description)
                .frame(height:100)
                .background(colorItem.color)
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                  /*
                  Button("Delete", role: .destructive) {
                    print("Delete")
                  }
                   */
                  Button {
                    print("Delete")
                  } label: {
                    Label("delete", systemImage: "trash")
                  }
                  .tint(.red)
                  
                  Button{
                    print("Edit")
                  } label: {
                    Label("Edit", systemImage: "pencil")
                  }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                  Button {
                    print("Delete")
                  } label: {
                    Label("Delete", systemImage: "trash")
                  }
                  .tint(.red)
                }
            }
            .listRowSeparator(.hidden)
          }
          .listStyle(.plain)
      }
    }
  func cell(_ colorItem: ColorItem, proxy: GeometryProxy, gridItems: [GridItem]) -> some View {
    ZStack {
      colorItem.color
        .padding(25)
        .frame(width: proxy.size.height / CGFloat(gridItems.count))
      Text(colorItem.color.description)
        .font(.headline)
        .background(Color.mint)
    }
  }
}

#Preview {
    MainView()
}
