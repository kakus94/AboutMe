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
      NavigationStack {
        ZStack{
          
          MenuView(selectedTab: $selectedTab, triger: $triger)
          
          
          VStack{}
            .CardStyle(triger: self.triger, numberCard: 2, offsetX: self.offsetX)
          
          
          VStack{}
            .CardStyle(triger: self.triger, numberCard: 1, offsetX: self.offsetX)
          
          
          VStack {
            Rectangle().opacity(0)
              .frame(height: 70)
            
            SwitchView(selectedTab: $selectedTab)
              .CardStyle(triger: self.triger, numberCard: 0, offsetX: self.offsetX)
              .padding()            
              
          }
         
          
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
        }
        .ignoresSafeArea(.all, edges: .all)
      }
      .animation(.default, value: triger)
      .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View {
  func AppBackground() -> some View {
    self.background(Color.blue.gradient)
  }
}


