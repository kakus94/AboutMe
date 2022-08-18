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
  
  @EnvironmentObject var appManager: AppManager
  
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
          Cell(text: "About me", imageString: "person")
        }
        .offset(x: triger ? 0 : -200)
        .animation(.default.delay(0.2), value: triger)

        Button(action: { changeView(tab: .education) }) {
          Cell(text: "Education", imageString: "book")
        }
        .offset(x: triger ? 0 : -200)
        .animation(.default.delay(0.3), value: triger)


        Button(action: { changeView(tab: .career) }) {
          Cell(text: "Career", imageString: "terminal")
        }
        .offset(x: triger ? 0 : -200)
        .animation(.default.delay(0.4), value: triger)


        Button(action: { changeView(tab: .myproject)  }) {
          Cell(text: "My Project", imageString: "text.viewfinder")
        }
        .offset(x: triger ? 0 : -200)
          .animation(.default.delay(0.5), value: triger)


        Button(action: { changeView(tab: .hooby)  }) {
          Cell(text: "Hobby", imageString: "star")

        }
        .offset(x: triger ? 0 : -200)
        .animation(.default.delay(0.6), value: triger)


        Button(action: { changeView(tab: .placesvisited) }) {
          Cell(text: "Places visited", imageString: "map")
        }
        .offset(x: triger ? 0 : -200)
        .animation(.default.delay(0.7), value: triger)
        
        Button(action: { appManager.LogOut() }) {
          Cell(text: "Log out", imageString: "arrowshape.left")
        }
        .offset(x: triger ? 0 : -200)
        .animation(.default.delay(0.7), value: triger)
        
      }
      .padding(.top)
      
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
      .frame(maxWidth: .infinity,alignment: .leading)
  }
}

private struct Cell: View {
  
  @State var text: String
  @State var imageString: String
  var color: Color = .white
  
  var body: some View{
    HStack {
      Image(systemName: imageString)
        .resizable().scaledToFit()
      Text(text)
        .textMenuStyle(color: color)
    }
    .frame(height: 30)
    .foregroundColor(.white)
    .AppShadow()
  }
  
}



