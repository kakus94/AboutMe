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

struct AboutMe {
  var text: String
}


struct Education: Identifiable {
  var id = UUID().uuidString
  var nameSchool: String
  var location: String
  var schooleGrade: String
  var startDate: Int
  var details: TileEducationDetails
}

struct Career: Identifiable {
  var id: String = UUID().uuidString
  var nameCompany: String
  var startDate: Date
  var endDate: Date
  var position: String
  var obligatory: String
  var training: [Training]
  var project: [Project]
  var description: String
}

struct MyProject {
  
}

struct Hobby {
  
}

struct PlaceVisited {
  
}

struct Project {
  var id = UUID().uuidString
  var nameProject: String
  var StartDate: Date
  var EndDate: Date
  var now: Bool
}

struct Training {
  var id = UUID().uuidString
  var date: Date
  var nameTraing: String
}


extension User {
  static func Mock() -> User {
    User(email: "email", uid: "uuid string", name: "name", lastName: "last name", work: "work", photo: "phtot url")
  }
}



extension AboutMe {
  static func Mock() -> AboutMe {
    AboutMe(text: "Text text text text text text text text text text")
  }
}



extension Education {
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


extension Career {
  
}

extension MyProject {
  
}

extension Hobby {
  
}

extension PlaceVisited {
  
}

extension Project {
  static func Mock(_ now: Bool = false) -> Project {
    Project(nameProject: "NameProject",
            StartDate: Date.now,
            EndDate: Date.now,
            now: now)
  }
}

extension Training{
  static func Mock() -> Training {
    Training(date: Date.now,
             nameTraing: "nameTraing")
  }
}

extension Career {
  static func Mock(_ now: Bool = false) -> Career {
    Career(nameCompany: "nameCompany",
           startDate: Date.now,
           endDate: Date.now,
           position: "Position",
           obligatory: "Obligatory",
           training: [Training.Mock(),Training.Mock()],
           project: [Project.Mock(true),Project.Mock(false)], description: "description")
  }
  
  static func Empty() -> Career {
    Career(nameCompany: "", startDate: Date.now, endDate: Date.now, position: "", obligatory: "", training: [], project: [], description: "")
  }
}
