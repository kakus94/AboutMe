//
//  AppManager.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 07/07/2022.
//

import Foundation

class AppManager: ObservableObject {
  
  //user
  var user: User?
  
  //is loggin
  @Published var isLogin: Bool = false
  
  
}
