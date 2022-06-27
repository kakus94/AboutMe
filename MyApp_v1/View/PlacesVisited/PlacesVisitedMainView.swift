//
//  PlacesVisitedMainView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 29/05/2022.
//

import SwiftUI

struct PlacesVisitedMainView: View {
    var body: some View {
      VStack {
        Text("Places Visited Main View")
      }
      .frame(maxWidth: .infinity,maxHeight: .infinity)
      .AppBackground()
    }
}

struct PlacesVisitedMainView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesVisitedMainView()
    }
}
