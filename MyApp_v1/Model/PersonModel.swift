//
//  PersonModel.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 06/06/2022.
//

import Foundation

class PersonModel{
  var name: String?
  var lastName: String?
  
  var birthday: Date?
  
  var profesion: String?
  
  var aboutME: String?

  static func Mock() -> PersonModel {
    let model = PersonModel()
    
    model.name = "Marek"
    model.lastName = "Kowalski"
    model.birthday = Date(timeIntervalSince1970: 772735499)
    model.profesion = "iOS Developer"
    
    model.aboutME = "ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst ble ble jakis tekst "
    
    return model
  }
}
