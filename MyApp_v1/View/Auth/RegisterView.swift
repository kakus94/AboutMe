//
//  Register.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 07/07/2022.
//

import SwiftUI

class RegisterViewModel: ObservableObject {
  @Published var email: String = ""
  @Published var pass: String = ""
  @Published var rePass: String = ""
  @Published var name: String = ""
  @Published var lastName: String = ""
  @Published var work: String = ""
  
  
  
  func send() {
    Task{
     await FirebaseHelper.Register(userModel: User(email: self.email,
                                              uid: "",
                                              name: self.name,
                                              lastName: self.lastName,
                                              work: self.work,
                                              photo: "smile.jpg"),
                              email: self.email,
                              pass: self.pass)
    }

  }
  
  func clear() {
    email = ""
    pass  = ""
    rePass = ""
    name = ""
    lastName = ""
    work = ""
  }
  
}

struct RegisterView: View {
  
  @StateObject var registerVM: RegisterViewModel = RegisterViewModel()
  
    var body: some View {
      ScrollView{
        
        Text("Register to VCV")
          .font(.largeTitle)
          .bold()
        
        EditingView(placeholder: "Login", text: $registerVM.email)
        EditingView(placeholder: "Password", text:  $registerVM.pass)
        EditingView(placeholder: "RePassword", text:  $registerVM.rePass)
        EditingView(placeholder: "First name", text:  $registerVM.name)
        EditingView(placeholder: "Last Name", text:  $registerVM.lastName)
        EditingView(placeholder: "Work", text:  $registerVM.work)
        
        
        VStack(spacing: 15) {
          ButtonSend
          ButtonClear
        }
        .padding()
        
      }
      .padding()
      .frame(maxWidth: .infinity,maxHeight: .infinity)
      .AppBackground()
      
    }
  
  //Layout
  var ButtonSend: some View {
    Button(action: registerVM.send ) {
      Text("Send")
        .frame(width:  UIScreen.main.bounds.width * 0.7, height: 50 )
        .foregroundColor(.black)
        .FormStyle()
    }
  }
  
  var ButtonClear: some View {
    Button(action: registerVM.clear) {
      Text("Clear")
        .frame(width:  UIScreen.main.bounds.width * 0.7, height: 50 )
        .foregroundColor(.black)
        .FormStyle()
    }
  }
  
  
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
