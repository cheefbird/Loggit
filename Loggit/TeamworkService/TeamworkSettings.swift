//
//  TeamworkConfig.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/22/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation



protocol TeamworkSettings {
  
  var savedUrl: URL { get }
  var savedKey: String { get }
  
}


extension TeamworkSettings where Self: TeamworkClient {
  
  var savedUrl: URL {
    return URL(string: "https://ciestudios.teamwork.com")!
  }
  
  var savedKey: String {
    return "walk370dryer"
  }
  
}
