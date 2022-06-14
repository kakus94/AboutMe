//
//  AboutMeViewMain.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 29/05/2022.
//

import SwiftUI

struct AboutMeMainView: View {
    var body: some View {
      VStack {
        ImageProfile
        
        Text("About Me Main View")
      }
      .navigationTitle("About Me")
      .frame( maxWidth: .infinity, maxHeight: .infinity)
      .AppBackground()
    }
  
    //layout
  var ImageProfile: some View {
    Image("profil")
      .resizable()
      .scaledToFill()
      .frame(width: 200, height: 200, alignment: .center)
      .clipShape(Circle())
  }
  
}

struct AboutMeMainView_Previews: PreviewProvider {
    static var previews: some View {
      AboutMeMainView()
    }
}
