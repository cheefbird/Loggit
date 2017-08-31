//
//  ProjectListViewViewModel.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/29/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


struct ProjectListViewViewModel {
  
  let projectService: ProjectService
  
  init() {
    projectService = ProjectService()
  }
  
  
  var projects: Observable<[Project]> {
    return projectService.getAllProjects()
  }
  
}
