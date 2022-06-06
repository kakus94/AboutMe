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
  
    var body: some View {
      NavigationView {
        ZStack{
          
          MenuView(selectedTab: $selectedTab, triger: $triger)
          
          
          VStack{}
            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .foregroundColor(.blue)
            .background(  LinearGradient(colors: [.blue, .red], startPoint: .bottom, endPoint: .top))
            .cornerRadius(triger ? 50 : 0 )
            .offset(x: triger ? 250 - 60: 0 , y: 0)
            .scaleEffect(triger ? 0.6 : 1 )
            .blur(radius: triger ? 1 : 0)
            .shadow(color: .black.opacity(0.8), radius: 10, x: -10, y: 0)
            .rotation3DEffect(.degrees(triger ? -25 + 10 : 0), axis: (x: 0, y: 1, z: -1))
          
      
          VStack{}
              .frame(maxWidth: .infinity, maxHeight: .infinity)
//              .foregroundColor( .blue)
              .background(  LinearGradient(colors: [.blue, .red], startPoint: .bottom, endPoint: .top))
              .cornerRadius(triger ? 50 : 0 )
              .offset(x: triger ? 250 - 30: 0 , y: 0)
              .scaleEffect(triger ? 0.65 : 1 )
              .blur(radius: triger ? 1 : 0)
              .shadow(color: .black.opacity(0.8), radius: 10, x: -10, y: -0)
              .rotation3DEffect(.degrees(triger ? -25 + 5 : 0), axis: (x: 0, y: 1, z: -1))

            
            SwitchView(selectedTab: $selectedTab)
              .cornerRadius(triger ? 50 : 0 )
              .offset(x: triger ? 250 : 0 , y: 0)
              .scaleEffect(triger ? 0.7 : 1 )
              .blur(radius: triger ? 1 : 0)
              .shadow(color: .black.opacity(0.8), radius: 10, x: -10, y: 0)
              .rotation3DEffect(.degrees(triger ? -25 : 0), axis: (x: 0, y: 1, z: -1))
         
          
          
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
