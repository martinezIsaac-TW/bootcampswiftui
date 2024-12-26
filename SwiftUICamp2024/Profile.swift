//
//  Profile.swift
//  SwiftUICamp2024
//
//  Created by Isaac Martínez on 08-11-24.
//

import SwiftUI

struct Profile: Encodable, Decodable, Identifiable {
  var id = UUID().uuidString
  
  var name: String
  var score: Int
  
  enum CodingKeys: String, CodingKey {
    case name = "first_name"
    case score
  }
  
  init(from decoder: any Decoder) throws {
    do {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      name = try container.decode(String.self, forKey: .name)
      score = try container.decode(Int.self, forKey: .score)
    } catch {
      print(error.localizedDescription)
      name = ""
      score = 0
    }
  }
  
  func encode(to encoder: any Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.name, forKey: .name)
    try container.encode(self.score, forKey: .score)
  }
  
  init(name: String? = nil, score: Int? = nil) {
    self.name = name ?? ""
    self.score = score ?? 0
  }
}
