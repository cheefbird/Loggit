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
import Action


class ProjectListViewViewModel {
  
  // MARK: - Properties
  
  let projectService: ProjectService
  
  let projects = Variable<[Project]>([])
  
  let disposeBag = DisposeBag()
  
  
  
  // MARK: - Init
  
  init() {
    print("** ProjectService Initialized **")
    projectService = ProjectService()
  }
  
  deinit {
    print("** ProjectService Deinitialized **")
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
          errorHandler("Your API key is invalid. Please re-enter your key to continue.")
      })
      .disposed(by: disposeBag)
    
  }
  
  /// Filter the list of projects used to populate the view to only include ones with a starred property equal to true.
  func removeUnstarredProjects() {
    let projects = self.projects.value
    
    var favorites = [Project]()
    
    for project in projects {
      if project.starred {
        favorites.append(project)
      }
    }
    
    self.projects.value = favorites
  }
  
  
  /// Acess the project at a specific index, if it exists.
  ///
  /// - Parameter index: Index of the project to return.
  /// - Returns: Project, if it exists.
  func project(at index: Int) -> Project? {
    
    guard index < numberOfProjects else { return nil }
    return projects.value[index]
  }
  
  
  // MARK: - CocoaActions
  
  func toggleFavorite(_ project: Project) -> CocoaAction {
    
    return CocoaAction {
      return self.projectService.toggleFavorite(project).map { _ in }
    }
    
  }
  
}
