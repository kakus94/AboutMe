//
//  CareerMainViewModel.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 14/08/2022.
//

import Foundation

class CareerMainViewModel: ObservableObject {
  
  //application manager reference
  var appManager: AppManager?
  
  @Published var careers: [Career] = [Career]()

  
  func Save(_ new: Career) {
    careers.removeAll{ $0.id == new.id }
    careers.append(new)
  }
  
  func Add(_ new: Career) {
    careers.append(new)
  }
  
  func Delete(_ deleteItem: Career) {
    careers.removeAll{ $0.id == deleteItem.id }
  }
  
  func refresh() {
    //check appManager
    guard let appManager else { return }
    //check user
    guard let user = appManager.user else { return }
    
    Task {
      do {
        let careers = try await FirebaseHelper.getDocument(datatype: CareerArray.self,
                                                           colection: "Career",
                                                           document: user.uid)
        
        DispatchQueue.main.async {
          self.careers = careers.array
        }
        
      } catch {
        print(error)
      }
    }
            
            
  }
  
}




extension CareerMainViewModel {
  static func Mock(_ count: Int = 4) -> CareerMainViewModel{
    var result = [Career]()
    for _ in 0...count {
      result.append(Career.Mock())
    }
    
    let model = CareerMainViewModel()
    model.careers = result
    return model
    
  }
}
