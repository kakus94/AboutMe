//
//  MyApp_v1App.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 10/05/2022.
//

import SwiftUI
import RiveRuntime

@main
struct MyApp_v1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
//          riveTest()
        }
    }
}



struct riveTest: View {
  
  //Rive
//  let hamButton = RiveViewModel(fileName: "animheartbeat", autoPlay: true, animationName: "pulse")
  
  var body: some View {
    VStack{
//      hamButton.view()
      
    }
  }
  
  
}


struct riveTest_Previews: PreviewProvider {
    static var previews: some View {
      riveTest()
    }
}
