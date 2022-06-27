//
//  HobbyMainView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 29/05/2022.
//

import SwiftUI

struct HobbyMainView: View {
    var body: some View {
      VStack {
        Text("Hobby Main View")
      }
      .frame(maxWidth: .infinity,maxHeight: .infinity)
      .AppBackground()
    }
}

struct HobbyMainView_Previews: PreviewProvider {
    static var previews: some View {
        HobbyMainView()
    }
}
