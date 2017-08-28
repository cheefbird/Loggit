//
//  TeamworkClientTests.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/28/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import XCTest
@testable import Loggit

class TeamworkClientTests: XCTestCase {
  
  // MARK: - Setup & Tear Down
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  
  // MARK: - Saved Properties Tests
  
  func test_SavedUrl_ReturnsCdlUrl() {
    
    XCTAssertEqual(TeamworkClient.shared.savedUrl.absoluteString, "https://ciestudios.teamwork.com")
    
  }
  
  func test_SavedKey_ReturnsMyKey() {
    
    XCTAssertEqual(TeamworkClient.shared.savedKey, "walk370dryer")
    
  }
  
  
  // MARK: - Test Base URL
  
  func test_BaseUrl_ReturnsSavedUrl_WhenInheritingSettings() {
    
    XCTAssertEqual(TeamworkClient.shared.baseURL.absoluteString, "https://ciestudios.teamwork.com")
    
  }
  
  
  
}
