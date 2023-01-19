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
  
  static func setData<T: Codable>(colection: String, document: String, data: T) throws {
    
    let db = Firestore.firestore()
    
    let decRef = db.collection(colection).document(document)
    do {
      try decRef.setData(from: data)
    } catch {
      print(error)
    }
    
  }
  
  static func deleteData(collection: String, document: String) throws {
    
    let db = Firestore.firestore()
    
    let docRef = db.collection(collection).document(document)
    
    Task {
      do {
        try await docRef.delete()
      } catch {
        print(error)
        throw FirebaseError.deleteDocumentError
      }
    }   
  }
  
  static func getDocument<T:Codable>(datatype: T.Type, colection: String, document: String ) async throws -> T {
    
    let db = Firestore.firestore()
    let refCol = db.collection(colection)
    
    let result = try await refCol.document(document).getDocument(as: T.self)
    
    return result
  }
  
  static func Register(userModel: User, email: String, pass: String) async throws -> (Bool) {
    
    do {
      
      let resultRegister = try await Auth.auth().createUser(withEmail: email, password: pass)
      
      let uuid = resultRegister.user.uid
      
      let user = User(email: userModel.email,
                      uid: uuid,
                      name: userModel.name,
                      lastName: userModel.lastName,
                      work: userModel.work,
                      photo: userModel.photo)
      
      try self.setData(colection: "User", document: uuid, data: user)
      
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


extension FirebaseHelper {
  enum FirebaseError: Error {
    case getDocumentError
    case deleteDocumentError
  }
}
