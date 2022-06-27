//
//  MenuBackGroundView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 10/05/2022.
//

import SwiftUI

struct MenuBackGroundView: View {
    var body: some View {
      VStack{
        
      }
      .frame(maxWidth: .infinity,maxHeight: .infinity)
      .background(Color.blue.gradient)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct MenuBackGroundView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBackGroundView()
    }
}
