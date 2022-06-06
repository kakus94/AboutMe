//
//  MenuContentView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 10/05/2022.
//

import SwiftUI

struct MenuContentView: View {
  
  @Binding var selectedTab: Tab
  @Binding var triger: Bool
  
  var color: Color = .white
  
  var body: some View {
    VStack{
      
      HStack {
        
        Image("profil")
          .resizable()
          .scaledToFill()
          .frame(width: 100, height: 100)
          .clipShape(Ellipse())
        
        VStack{
          Text("Kamil")
            .font(.title2)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
          
          Text("Karpiak")
            .font(.title2)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.white)
       
        Spacer()
        
      }
      
      Text("iOS developer")
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
      
      
      VStack(spacing: 25){
          Button(action: { changeView(tab: .aboutme) }) {
            Text("About me")
              .textMenuStyle(color: color)
              .offset(x: triger ? 0 : -200)
              .animation(.default.delay(0.2), value: triger)
          }
          Button(action: { changeView(tab: .education) }) {
            Text("Education")
              .textMenuStyle(color: color)
              .offset(x: triger ? 0 : -200)
              .animation(.default.delay(0.3), value: triger)
          }
          Button(action: { changeView(tab: .career) }) {
            Text("Career")
              .textMenuStyle(color: color)
              .offset(x: triger ? 0 : -200)
              .animation(.default.delay(0.4), value: triger)
          }
          Button(action: { changeView(tab: .myproject)  }) {
            Text("My Project")
              .textMenuStyle(color: color)
              .offset(x: triger ? 0 : -200)
              .animation(.default.delay(0.5), value: triger)
          }
          Button(action: { changeView(tab: .hooby)  }) {
            Text("Hobby")
              .textMenuStyle(color: color)
              .offset(x: triger ? 0 : -200)
              .animation(.default.delay(0.6), value: triger)
          }
          Button(action: { changeView(tab: .placesvisited) }) {
            Text("Places visited")
              .textMenuStyle(color: color)
              .offset(x: triger ? 0 : -200)
              .animation(.default.delay(0.7), value: triger)
          }
     
      }
      .padding(.top)
//      .padding(.leading)
      
      
      
      Spacer()
    }
    .padding(.top, 80)
  }
  
  func changeView(tab: Tab){
    self.selectedTab = tab
    self.triger = false
  }
  
}

struct MenuContentView_Previews: PreviewProvider {
  static var previews: some View {
    MenuContentView(selectedTab: .constant(.aboutme), triger: .constant(true))
      .background(.gray)
  }
}

extension Text {
  func textMenuStyle(color: Color) -> some View {
    self
      .foregroundColor(color)
      .font(.title2)
      .bold()
      .shadow(color: .white, radius: 1, x: 1, y: 1)
      .frame(maxWidth: .infinity,alignment: .leading)
  }
}
