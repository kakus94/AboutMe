//
//  MyProjectMainView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 29/05/2022.
//

import SwiftUI

struct MyProjectMainView: View {
    var body: some View {
      VStack {
        Text("My Project Main View")
      }
      .frame(maxWidth: .infinity,maxHeight: .infinity)
      .AppBackground()
    }
}

struct MyProjectMainView_Previews: PreviewProvider {
    static var previews: some View {
        MyProjectMainView()
    }
}
