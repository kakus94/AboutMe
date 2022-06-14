//
//  ExtensionApp.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 06/06/2022.
//

import SwiftUI

extension View {
  func AppShadow() -> some View {
    self
      .shadow(color: .white, radius: 1, x: 1, y: 1)
  }
}
