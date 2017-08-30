//
//  Project.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/29/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON


class Project: Object {
  
  // MARK: - Stored Properties
  
  dynamic var starred = false
  dynamic var logo = ""
  dynamic var id = 0
  dynamic var companyName = ""
  dynamic var name = ""
  
  
  // MARK: - Computed Properties
  
  var logoImageUrl: URL? {
    return URL(string: logo) ?? nil
  }
  
  
  // MARK: - JSON Initialize
  convenience init(fromJSON json: JSON) {
    self.init()
    
    starred = json["starred"].boolValue
    
    if let logoString = json["logo"].string {
      logo = logoString
    }
    
    id = json["id"].intValue
    companyName = json["company"]["name"].stringValue
    name = json["name"].stringValue
  }
  
}












