//
//  ProjectStubs.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/30/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import SwiftyJSON


internal func mockProjectJSON(withLogoString logo: String? = nil) -> JSON {
  var dict = [String: Any]()
  
  dict["starred"] = false
  dict["logo"] = logo ?? ""
  dict["id"] = 123456
  dict["company"] = ["name": "SleepScore Labs"]
  dict["name"] = "SleepScore Max Mobile App"
  
  return JSON(dict)
}
