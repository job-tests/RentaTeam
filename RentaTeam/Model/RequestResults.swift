//
//  RequestResults.swift
//  RentaTeam
//
//  Created by Kirill Drozdov on 10.03.2022.
//

import Foundation

struct RequestResults: Codable {
  let total   : Int
  let results : [PhotoData]
}

struct PhotoData: Codable {
  let width       :   Int
  let height      :   Int
  let urls        :   [URLType.RawValue:String]
  let user        :   User
  let createdAt   :   Date
  var isFavourite :   Bool = false
  
  enum URLType: String {
    case raw
    case full
    case regular
    case small
    case thumb
  }
  
  enum CodingKeys: String, CodingKey {
    case width
    case height
    case urls
    case user
    case createdAt = "created_at"
  }
}

struct User: Codable {
  let username: String
}
