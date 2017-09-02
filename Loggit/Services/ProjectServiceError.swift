//
//  ProjectServiceError.swift
//  Loggit
//
//  Created by Francis Breidenbach on 9/1/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation


enum ProjectServiceError: Error {
  
  case userNotAuthorized
  case projectNotFound(Int)
  case unhandledCode
  
}

extension ProjectServiceError: LocalizedError {
  
  public var errorDescription: String? {
    let prefix = "ProjectServiceError: "
    switch self {
    case .projectNotFound(let id):
      return prefix + "Project id \(id) not found. Please try again."
    case .userNotAuthorized:
      return prefix + "API key not authorized to access this account."
    case .unhandledCode:
      return prefix + "Unhandled status code received. Please implement handling."
    }
    
  }
  
}






