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
  
  //object reference
  var infoModel: ModalInfoViewModel!
  var waitModel: waitViewModel!
  
  
  func send() {
    Task{
      
     await waitModel.show()
      
     let sucess = try? await FirebaseHelper.Register(userModel: User(email: self.email,
                                              uid: "",
                                              name: self.name,
                                              lastName: self.lastName,
                                              work: self.work,
                                              photo: "smile.jpg"),
                              email: self.email,
                              pass: self.pass)
      if sucess == false {
        DispatchQueue.main.async {
          self.infoModel.showModalError(head: "Rejestracja",
                                   message: "Rejestracja nie powiodla sie cos poszlo nie tak",
                                   buttonText: "Ups")
        }
     
      }
      
      await waitModel.hidden()
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
  
  @EnvironmentObject var modalInfo: ModalInfoViewModel
  @EnvironmentObject var waitModel: waitViewModel
  
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
      .accentColor(.white)
      .AppBackground()
      .onAppear{
        registerVM.waitModel = waitModel
        registerVM.infoModel = modalInfo
      }
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
