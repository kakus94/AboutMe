//
//  MenuView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 11/05/2022.
//

import SwiftUI

struct MenuView: View {
  
  @Binding var selectedTab: Tab
  @Binding var triger: Bool
  
    var body: some View {
      ZStack{
        MenuBackGroundView()
        MenuContentView(selectedTab: $selectedTab, triger: $triger)
          .padding()
      }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
      MenuView(selectedTab: .constant(.aboutme), triger: .constant(false))
    }
}


