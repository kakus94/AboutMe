//
//  ContentView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 10/05/2022.
//

import SwiftUI

struct ContentView: View {
  
  @State var triger: Bool = false
  @State var selectedTab: Tab = .aboutme
  
  //Rive
//  let hamButton = RiveViewModel(fileName: "hamburger_menu", stateMachineName: "State Machine 1", autoPlay: false, animationName: "HamburgerToX")
  
  //config
  let offsetX: CGFloat = 300
  let scaleTriger: CGFloat = 0.8
  

  
    var body: some View {
      NavigationView {
        ZStack{
          
          MenuView(selectedTab: $selectedTab, triger: $triger)
          
          
          VStack{}
            .CardStyle(triger: self.triger, numberCard: 2, offsetX: self.offsetX)
          
          
          VStack{}
            .CardStyle(triger: self.triger, numberCard: 1, offsetX: self.offsetX)
          
          
          SwitchView(selectedTab: $selectedTab)
            .CardStyle(triger: self.triger, numberCard: 0, offsetX: self.offsetX)
          
         
          
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Nav Title")
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button(action: { triger.toggle() }) {
              VStack(spacing: 6) {
                Rectangle()
                  .frame(width: 30, height: 2, alignment: .center)
                  .rotationEffect(Angle.degrees(triger ? -45 : 0))
                  .offset( y: triger ? 6 : 0)
                Rectangle()
                  .frame(width: 30, height: triger ? 0 : 2, alignment: .center)
                Rectangle()
                  .frame(width: 30, height: 2, alignment: .center)
                  .rotationEffect(Angle.degrees(triger ? 45 : 0))
                  .offset( y: triger ? -6 : 0)
              }
              .foregroundColor(.white)
            }
           
          }
        }.ignoresSafeArea(.all, edges: .all)
      }
      .animation(.default, value: triger)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View {
  func AppBackground() -> some View {
    self.background(  LinearGradient(colors: [.blue, .red], startPoint: .bottom, endPoint: .top))
  }
}


extension View {
  func CardStyle(triger: Bool, numberCard: Int, offsetX: CGFloat = 300, scaled: CGFloat = 0.8) -> some View {
    self
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(  LinearGradient(colors: [.blue, .red], startPoint: .bottom, endPoint: .top))
      .cornerRadius(triger ? 30 : 0 )
      .offset(x: triger ? offsetX - CGFloat((20 * numberCard)) : 0 , y: 0)
      .scaleEffect(triger ? scaled : 1 )
      .blur(radius: triger ? 1 : 0)
      .shadow(color: .black.opacity(0.8), radius: 10, x: -10, y: 0)
      .rotation3DEffect(.degrees(triger ? Double(-25 + ( 5 * numberCard)) : 0), axis: (x: 0, y: 1, z: -1))
  }
}
