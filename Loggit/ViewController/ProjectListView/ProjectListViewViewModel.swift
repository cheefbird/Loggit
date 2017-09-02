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


class ProjectListViewViewModel {
  
  // MARK: - Properties
  
  let projectService: ProjectService
  
  let projects = Variable<[Project]>([])
  
  let disposeBag = DisposeBag()
  
  
  // MARK: - Init
  
  init() {
    projectService = ProjectService()
  }
  
  
  // MARK: - Computed Properties
  
  var numberOfProjects: Int { return projects.value.count }
  
  
  // MARK: - Methods
  
  /// Refresh the projects Variable in the view model with the latest array of projects.
  func updateProjects(errorHandler: @escaping ((String) -> Void)) {
    
    projectService.getAllProjects()
      .subscribe(onNext: { [weak self] in
        self?.projects.value = $0
        }, onError: { error in
          errorHandler(error.localizedDescription)
      })
      .disposed(by: disposeBag)
    
  }
  
  
  /// Acess the project at a specific index, if it exists.
  ///
  /// - Parameter index: Index of the project to return.
  /// - Returns: Project, if it exists.
  func project(at index: Int) -> Project? {
    
    guard index < numberOfProjects else { return nil }
    return projects.value[index]
  }
  
  
}
