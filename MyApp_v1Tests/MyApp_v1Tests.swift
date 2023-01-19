//
//  MyApp_v1Tests.swift
//  MyApp_v1Tests
//
//  Created by Kamil Karpiak on 10/05/2022.
//

import XCTest
//import FirebaseCore
//import FirebaseFirestore
//import FirebaseAuth

@testable import MyApp_v1

class MyApp_v1Tests: XCTestCase {
  
  let login: String =  "test@test.com"
  let passw: String =  "!QAZxsw2"
  //  var user: User?
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // Any test you write for XCTest can be annotated as throws and async.
    // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
    // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
  }
  
  
  func testLoginToFirebase() async throws {
    
    let (resut, _) = await FirebaseHelper.Login(login, passw)
    //    self.user = user
    XCTAssertTrue(resut)
  }
  
  func testEducationSetDocument() async throws {
    
    let (resut, user) = await FirebaseHelper.Login(login, passw)
    
    XCTAssertTrue(resut)
        
    let education: [Education] = [.init(nameSchool: "TestName1",
                                        location: "TestLocalion1",
                                        schooleGrade: "TestShoolGrate1",
                                        startDate: 2022,
                                        details: TileEducationDetails.init(specialization: "TestSpecialization1",
                                                                           extraClasses: "TestExtraClass1",
                                                                           project: "TestProject1")),
                                  .init(nameSchool: "TestName2",
                                        location: "TestLocalion2",
                                        schooleGrade: "TestShoolGrate2",
                                        startDate: 2022,
                                        details: TileEducationDetails.init(specialization: "TestSpecialization2",
                                                                           extraClasses: "TestExtraClass2",
                                                                           project: "TestProject2"))]
    
    var array: EducationArray = .init(array: education)
    
    array.checksum = Helper.calculateCheckSum(education)
    
    guard let user else { XCTFail(); return }
    
    print("id: \(user.uid)")
    try FirebaseHelper.setData(colection: "Education", document: user.uid, data: array)
    
  }
  
  func testEducationDelete() async throws {
    
    let (resut, user) = await FirebaseHelper.Login(login, passw)
    
    XCTAssertTrue(resut)
    
    guard let user else { XCTFail(); return }
    
    try FirebaseHelper.deleteData(collection: "Education", document: user.uid)
    
  }
  
  func testCareerSetDocument() async throws {
    
    let (resut, user) = await FirebaseHelper.Login(login, passw)
    XCTAssertTrue(resut)
        
    let careers: [Career] = [.init(nameCompany: "NameCompany1",
                                   startDate: Date.now,
                                   endDate: Date.now,
                                   position: "position1",
                                   obligatory: "oblogatory1",
                                   training: [.init(date: Date.now,
                                                    nameTraing: "nameTraing1")],
                                   project: [.init(nameProject: "nameProject1",
                                                   StartDate: Date.now,
                                                   EndDate: Date.now,
                                                   now: true)],
                                   description: "description1"),
                             .init(nameCompany: "NameCompany2",
                                   startDate: Date.now,
                                   endDate: Date.now,
                                   position: "position2",
                                   obligatory: "oblogatory2",
                                   training: [.init(date: Date.now,
                                                    nameTraing: "nameTraing2")],
                                   project: [.init(nameProject: "nameProject2",
                                                   StartDate: Date.now,
                                                   EndDate: Date.now,
                                                   now: true)],
                                   description: "description2")]
    
    var array: CareerArray = .init(array: careers)

    array.checksum = Helper.calculateCheckSum(careers)
   
    guard let user else { XCTFail(); return }
    
    try FirebaseHelper.setData(colection: "Career", document: user.uid, data: array)
    
  }
  
  func testGetEducationDocument() async throws {
    
    let result = try await FirebaseHelper.getDocument(datatype: EducationArray.self,
                                                      colection: "Education",
                                                      document: "M3QKWdiMMnZxakABMIE59t7xv5I2")
    print(result)    
  }
  
  func testGetCareerDocument() async throws {
    
    let result = try await FirebaseHelper.getDocument(datatype: CareerArray.self,
                                                      colection: "Career",
                                                      document: "M3QKWdiMMnZxakABMIE59t7xv5I2")
        
    print(result)
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}


