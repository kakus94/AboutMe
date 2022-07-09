//
//  User.swift
//  MyApp_v1
//
//  Created by Kamil Karpiak on 07/07/2022.
//

import Foundation


struct User {
  var id: String = UUID().uuidString
  var email: String
  var uid: String
  var name: String
  var lastName: String
  var work: String
  var photo: String
}



struct Education: Identifiable {
  var id = UUID().uuidString
  var nameSchool: String
  var location: String
  var schooleGrade: String
  var startDate: Int
  var details: TileEducationDetails
  
  static func Mock() -> Self {
    return Education(nameSchool: "Mock name",
                     location: "Mock location",
                     schooleGrade: "3.5",
                     startDate: 2002,
                     details: TileEducationDetails.Mock)
  }
  
  static func Empty() -> Education {
    Education(nameSchool: "",
              location: "",
              schooleGrade: "",
              startDate: 0000,
              details: TileEducationDetails(specialization: "",
                                            extraClasses: "",
                                            project: ""))
  }
}
