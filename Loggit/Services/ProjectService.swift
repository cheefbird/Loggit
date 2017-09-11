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
import RealmSwift


class ProjectService: PersistentService {
  
  
  init() {
    refreshLocal()
  }
  
  // MARK: - Methods
  
  @discardableResult
  func projects() -> Results<Project> {
    let realm = try! Realm()
    
    return realm.objects(Project.self)
    
  }
  
  /// Change a project's starred property to its opposite.
  ///
  /// - Parameter project: Project to change
  /// - Returns: Observable of the same project, now updated.
  @discardableResult
  func toggleFavorite(_ project: Project) -> Observable<Project> {
    
    project.starred = !project.starred
    
    return .just(project)
    
  }
  
  
  // MARK: - Private Methods
  
  
  /// Request all projects from server and update local realm database.
  ///
  /// - Returns: Discardable array of projects
  @discardableResult
  private func refreshLocal() -> Observable<[Project]> {
    
    let projects = withRealm("fetch and save all projects") { realm -> Observable<[Project]> in
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
        .do(onNext: { results in
          for project in results {
            try! realm.write {
              realm.add(project, update: true)
            }
          }
        })
    }
    
    return projects ?? .error(ProjectServiceError.emptyResponse)
    
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











