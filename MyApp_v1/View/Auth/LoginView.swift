//
//  LoginView.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 06/07/2022.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginViewModel: ObservableObject {
  
  @Published var login: String = "test@test.com"
  @Published var password: String = "!QAZxsw2"
  @Published var isLogin: Bool = false
  
  @Published var  appManager: AppManager!
  
  func setStatusLogin(_ result: Bool) {
    
    guard let appManager else { return }
    
    appManager.isLogin = result
    appManager.objectWillChange.send()
    
  }
  
  func loginProcess() {
    Task{
      
      let (result, user) = await FirebaseHelper.Login(login, password)
      
      appManager.user = user
      
      DispatchQueue.main.async { [self] in
        setStatusLogin(result)
      }
    }
    
  }
  
}

struct LoginView: View {
  
  @EnvironmentObject var appManager: AppManager
  
  @StateObject var loginVM: LoginViewModel = LoginViewModel()
  
  @State var showRegister: Bool = false
  
  var body: some View {
    NavigationStack{
      VStack{
        Text("Virtual CV")
          .font(.largeTitle)
          .bold()
        
        EditingView(placeholder: "Login", text: $loginVM.login)
        EditingView(placeholder: "Password", text:  $loginVM.password)
        
        //button section
        VStack(spacing: 15){
          ButtonLogin
          ButtonRegister
          ButtonForgot
        }
        .padding()
        
      }
      .padding()
      .frame(maxWidth: .infinity,maxHeight: .infinity)
      .AppBackground()
    }
    
   
    
    .onAppear {
      loginVM.appManager = appManager
    }
    
  }
  
  //Layout
  var ButtonLogin: some View {
    Button(action: loginVM.loginProcess ) {
      Text("Login")
        .frame(width:  UIScreen.main.bounds.width * 0.7, height: 50 )
        .foregroundColor(.black)
        .FormStyle()
    }
  }
  
  var ButtonRegister: some View {
    NavigationLink {
      RegisterView()
    } label: {
      Text("Register")
        .frame(width:  UIScreen.main.bounds.width * 0.7, height: 50 )
        .foregroundColor(.black)
        .FormStyle()
    }
  }
  
  var ButtonForgot: some View {
    Button(action: { }) {
      Text("Forgot password")
        .frame(width:  UIScreen.main.bounds.width * 0.7, height: 50 )
        .foregroundColor(.black)
        .FormStyle()
    }
  }
  
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
      .environmentObject(AppManager())
  }
}
