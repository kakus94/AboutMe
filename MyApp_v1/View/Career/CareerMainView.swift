//
//  CareerMainView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 29/05/2022.
//

import SwiftUI

struct CareerMainView: View {
    var body: some View {
      VStack {
        Text("Career Main View")
      }
      .frame(maxWidth: .infinity,maxHeight: .infinity)
      .AppBackground()
    }
}

struct CareerMainView_Previews: PreviewProvider {
    static var previews: some View {
        CareerMainView()
    }
}
