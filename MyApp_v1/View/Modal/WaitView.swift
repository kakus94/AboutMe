//
//  WaitView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 09/07/2022.
//

import SwiftUI

class waitViewModel: ObservableObject {
  
  @Published var isActive: Bool = false
  
  
  @MainActor
  func show() {
    DispatchQueue.main.async {
      self.isActive = true
    }
  }
  
  @MainActor
  func hidden() {
    DispatchQueue.main.async {
      self.isActive = false
    }
  }
}

struct WaitView: View {
  
  @StateObject var model: waitViewModel = waitViewModel()
  
    var body: some View {
      VStack{
        Button(action: { model.isActive = true }) {
          Text("Show Progress View ")
        }
        Spacer()
      }
      .WaitView($model.isActive)
    }
}

struct WaitView_Previews: PreviewProvider {
    static var previews: some View {
        WaitView()
        .background(Color.orange)
    }
}


extension View {
  func WaitView(_ isActive: Binding<Bool>) -> some View {
    ZStack {
      self
        .blur(radius: isActive.wrappedValue ? 5 : 0)
      if isActive.wrappedValue {
        VStack {
          Text("VCV")
            .font(.title)
          ProgressView()
            .scaleEffect(2)
        }
        .frame(width: UIScreen.main.bounds.width / 3 , height: UIScreen.main.bounds.width / 3  )
        .background(Color.white.opacity(0.5))
        .cornerRadius(15)
      
      }
    }
  }
}
