//
//  ModalInfoView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 09/07/2022.
//

import SwiftUI

class ModalInfoViewModel: ObservableObject {
  
  //Show modal variable
  @Published var isActive: Bool = false
  
  @Published var head: String = "Header"
  @Published var message: String = "message message message message message message v message message message message message message"
  
  @Published var leftButton: Button_t = Button_t(text: "LEFT", color: .black)
  @Published var rightButton: Button_t = Button_t(text: "RIGHT", color: .red)
  
  @Published var type: TypeButton = .one
  
  @MainActor
  func clear() {
    self.message = ""
    self.head = ""
  }
  
  enum TypeButton{
    case one, two
  }
  
  struct Button_t {
    var text: String = ""
    var handler: () -> Void = { print("not implemented yet") }
    var color: Color = .black
  }
  
  
  //func
  @MainActor
  func showModalError(head: String, message: String, buttonText: String){
    self.clear()
    self.head = head
    self.message = message
    self.leftButton.text = buttonText
    self.leftButton.handler = { self.isActive = false  }
    self.isActive = true
  }
  
}

struct ModalInfoView: View {
  
  @EnvironmentObject var model: ModalInfoViewModel
  
  var body: some View {
    VStack(spacing: 0){
      // Top
      Text(model.head)
        .font(.title3)
        .bold()
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(.blue)
        .foregroundColor(.white)
      
      
      // Mid info
      Divider()
      Text(model.message)
        .padding(.vertical)
      
      
      // Bottom
      Divider()
      HStack{
        Button(action: model.leftButton.handler) {
          Text(model.leftButton.text)
            .frame(maxWidth: .infinity)
            .foregroundColor(model.leftButton.color)
        }
        
        if model.type == .two {
          Divider()
          Button(action: model.rightButton.handler) {
            Text(model.rightButton.text)
              .frame(maxWidth: .infinity)
              .foregroundColor(model.rightButton.color)
          }
        }
        
      }
      .foregroundColor(.black)
      .frame(height: 50)
      
    }
    .ModalStyle
  }
}



struct testView: View {
  
  @StateObject var modal = ModalInfoViewModel()
  
  var body: some View {
    VStack{
      Button(action: {modal.isActive = true }) {
        Text("Show Modal")
      }
      Spacer()
    }
    .modalInfo($modal.isActive)
    .environmentObject(modal)
  }
  
  
}


struct ModalInfoView_Previews: PreviewProvider {
  static var previews: some View {
    VStack{
      ModalInfoView()
        .environmentObject(ModalInfoViewModel())
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .AppBackground()
    
    
    testView()
  }
}



extension View {
  var ModalStyle: some View {
    self
      .frame(maxWidth: .infinity)
      .background(.regularMaterial)
      .cornerRadius(20)
      .padding()
      .shadow(radius: 10,x: 5,y: 5)
    
  }
  
  
  func modalInfo(_ isActive: Binding<Bool>) -> some View {
    ZStack{
      self
        .blur(radius: isActive.wrappedValue ? 3 : 0)
      if isActive.wrappedValue {
        ModalInfoView()
      }
    }
  }
  
  
}
