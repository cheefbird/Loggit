//
//  TeamworkClient.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/22/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import Alamofire


class TeamworkClient: TeamworkSettings {
  
  
  // MARK: - Singleton
  static let shared = TeamworkClient()
  
  private init() { }
  
  
  // MARK: - Computed Properties
  var baseURL: URL {
    return savedUrl
  }
  
}
