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
  
  func getAllProjects() -> Observable<[Project]> {
    
    return RxAlamofire.requestJSON(TeamworkRouter.getProjects)
      .filter { response, _ in
        return 200..<300 ~= response.statusCode
      }
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













