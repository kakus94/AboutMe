//
//  FirebaseHelper.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 07/07/2022.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


class FirebaseHelper {
  
  
  
  static func Register(userModel: User, email: String, pass: String) async -> (Bool) {
    
    do {
      
      let resultRegister = try await Auth.auth().createUser(withEmail: email, password: pass)
      
      let uuid = resultRegister.user.uid
      
      let db = Firestore.firestore()
      let refCol = db.collection("User")
      
      try await refCol.document(uuid).setData(["email" : email,
                                     "lastName": userModel.lastName,
                                     "name": userModel.name,
                                     "uid": uuid,
                                     "photo": userModel.photo,
                                     "work": userModel.work])
      
      print("Regiter sucess \(uuid)")
      
      return true
      
    } catch {
      
      print(error)
      return false
      
    }
    
  }

  
  static func Login(_ email: String, _ pass: String) async -> (result: Bool, user: User?) {
    
    do {
      let loginResult = try await Auth.auth().signIn(withEmail: email, password: pass)
      
      let uuid = loginResult.user.uid
      
      let db = Firestore.firestore()
      let ref = db.collection("User").document(uuid)
      
      let doc = try await ref.getDocument()
      
      let dictionary = doc.data()
      
     
      
      guard let dictionary else { return  (result: true, user: nil )}
      
      print(dictionary)
      
      let userResult = User(email:    dictionary.getString("email") ,
                            uid: uuid,
                            name:     dictionary.getString("name"),
                            lastName: dictionary.getString("lastName"),
                            work:     dictionary.getString("work"),
                            photo:    dictionary.getString("photo"))
      
      return (result: true, user: userResult)
      
    } catch {
      print(error)
      
      return (result: false, user: nil)
    }
    
    

    
  }
  
  
  
  
}
      
extension Dictionary where Key == String {
  
  func getString(_ keyString: String) -> String {
    return self[keyString] as? String ?? ""
  }
  
}
