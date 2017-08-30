//
//  ProjectTests.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/30/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import SwiftyJSON
import RealmSwift
import XCTest
@testable import Loggit

class ProjectTests: XCTestCase {
  
  // MARK: - Properties
  
  var realm: Realm!
  
  let config = Realm.Configuration(
    fileURL: nil,
    inMemoryIdentifier: "test",
    syncConfiguration: nil,
    encryptionKey: nil,
    readOnly: false,
    schemaVersion: 0,
    migrationBlock: nil,
    deleteRealmIfMigrationNeeded: true,
    shouldCompactOnLaunch: nil,
    objectTypes: nil)
  
  override func setUp() {
    super.setUp()
    
    realm = try! Realm(configuration: config)
    
    try! realm.write {
      realm.deleteAll()
    }
    
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  
  // MARK: - Tests for JSON Init
  
  func test_ProjectInit_WithLogo() {
    
    let json = mockProjectJSON(withLogoString: "http://clean-swift.com/wp-content/uploads/2015/08/Swift.png")
    let project = Project(fromJSON: json)
    
    debugPrint(project)
    
    XCTAssertEqual(project.starred, false)
    XCTAssertEqual(project.logo, "http://clean-swift.com/wp-content/uploads/2015/08/Swift.png")
    XCTAssertEqual(project.id, 123456)
    XCTAssertEqual(project.companyName, "SleepScore Labs")
    XCTAssertEqual(project.name, "SleepScore Max Mobile App")
  }
  
  func test_ProjectInit_WithoutLogo() {
    
    let json = mockProjectJSON()
    let project = Project(fromJSON: json)
    
    debugPrint(project)
    
    XCTAssertEqual(project.starred, false)
    XCTAssertEqual(project.logo, "")
    XCTAssertEqual(project.id, 123456)
    XCTAssertEqual(project.companyName, "SleepScore Labs")
    XCTAssertEqual(project.name, "SleepScore Max Mobile App")
  }
  
  
  // MARK: - Tests for ImageURL
  
  func test_ImageUrl_NotNil() {
    
    let json = mockProjectJSON(withLogoString: "http://clean-swift.com/wp-content/uploads/2015/08/Swift.png")
    let project = Project(fromJSON: json)
    
    let url = URL(string: "http://clean-swift.com/wp-content/uploads/2015/08/Swift.png")
    
    XCTAssertEqual(project.logoImageUrl, url)
    
  }
  
  func test_ImageUrl_Nil() {
    
    let json = mockProjectJSON()
    let project = Project(fromJSON: json)
    
    XCTAssertNil(project.logoImageUrl)
    
  }
  
}












