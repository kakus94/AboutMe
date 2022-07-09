//
//  MyApp_v1App.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 10/05/2022.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    
    
    return true
  }
}

@main
struct MyApp_v1App: App {
  
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  @StateObject var appManager: AppManager = AppManager()
  
  var body: some Scene {
    WindowGroup {
      
//      NavigationStack {
      if appManager.isLogin == false {
         LoginView()
            .environmentObject(appManager)
        } else {
          ContentView()
            .environmentObject(appManager)
        }
        
//      }
      
      
     
      
    }
  }
}



struct riveTest: View {

  
  var body: some View {
    VStack{
      
    }
  }
  
  
}

//
//struct MyApp_v1App_Previews: PreviewProvider {
//  static var previews: some View {
//    MyApp_v1App()
//  }
//}
