//
//  ProjectService.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/30/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire
import SwiftyJSON


class ProjectService {
  
  /// Fetch all Projects from Teamwork API that current user has access to.
  ///
  /// - Returns: Observable Array of Project Objects.
  /// - Throws: ProjectServiceError from bad API responses.
  func getAllProjects() -> Observable<[Project]> {
    
    return RxAlamofire.requestJSON(TeamworkRouter.getProjects)
      .observeOn(MainScheduler.instance)
      .map { _, jsonResponse -> [JSON] in
        
        let jsonResponse = JSON(jsonResponse)
        return jsonResponse["projects"].arrayValue
        
      }
      .map { jsonArray in
        return jsonArray.map { project in
          return Project(fromJSON: project)
        }
    }
  }
}



// MARK: - Error Helper
extension ProjectService {
  
  /// Convert error code to ProjectServiceError
  ///
  /// - Parameter code: HTTP response code as Int
  /// - Returns: ProjectServiceError
  func getError(forCode code: Int) -> ProjectServiceError {
    
    switch code {
    case 401:
      return ProjectServiceError.userNotAuthorized
      
    case 404:
      return ProjectServiceError.projectNotFound(0)
      
    default:
      return ProjectServiceError.unhandledCode
      
    }
  }
  
}











