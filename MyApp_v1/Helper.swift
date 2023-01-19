//
//  Helper.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 17/10/2022.
//

import Foundation
import CryptoKit

class Helper {
  
  static func calculateCheckSum<T: Codable>(_ object: T) -> String {
    
    let jsonEncoder = JSONEncoder()
    let jsonData = try! jsonEncoder.encode(object)
    let hash = jsonData.hashValue
    return String((jsonData.hashValue))
  }
  

}
