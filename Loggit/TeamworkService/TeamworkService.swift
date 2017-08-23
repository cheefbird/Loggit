//
//  TeamworkService.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/22/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import Alamofire


class TeamworkService: TeamworkSettings {
  
  
  // MARK: - Singleton
  static let shared = TeamworkService()
  
  private init() { }
  
  
  // MARK: - Computed Properties
  var baseURL: URL {
    return savedUrl
  }
  
}
