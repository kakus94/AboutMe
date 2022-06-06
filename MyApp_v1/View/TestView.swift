//
//  TestView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 11/05/2022.
//

import SwiftUI

struct TestView: View {
    var body: some View {
      ZStack {
        Rectangle()
          .foregroundColor(.green).ignoresSafeArea(.all, edges: .all)
        VStack{
          Text("dasdsa")
          Text("dasdsa")
          Text("dasdsa")
          Text("dasdsa")
          Text("dasdsa")
          Text("dasdsa")
          Text("dasdsa")
        }
      }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
