//
//  CardBackgroundView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 14/06/2022.
//

import SwiftUI



extension View {
  func CardStyle(triger: Bool, numberCard: Int, offsetX: CGFloat = 300, scaled: CGFloat = 0.8) -> some View {
    self
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.blue.gradient)
      .cornerRadius(triger ? 30 : 20)
      .offset(x: triger ? offsetX - CGFloat((20 * numberCard)) : 0 , y: 0)
      .scaleEffect(triger ? scaled : 1 )
      .blur(radius: triger ? 1 : 0)
      .shadow(color: triger ? .black.opacity(0.8) : .black.opacity(0.3), radius: 10, x: -10, y: 0)
      .rotation3DEffect(.degrees(triger ? Double(-25 + ( 5 * numberCard)) : 0), axis: (x: 0, y: 1, z: -1))
    
  }
}


extension Button {
  func RectangleStyle(color: Color, width: CGFloat = UIScreen.main.bounds.width * 0.5, height: CGFloat = 50) -> some View {
    self
      .frame(width:  width, height: height )
      .FormStyle(color)
  }
}

extension View {
  @ViewBuilder func applyTextColor(_ color: Color) -> some View {
    if UITraitCollection.current.userInterfaceStyle == .light {
      self.colorInvert().colorMultiply(color)
    } else {
      self.colorMultiply(color)
    }
  }
}
