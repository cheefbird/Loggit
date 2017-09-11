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
import RealmSwift


class ProjectListViewViewModel {
  
  // MARK: - Properties
  
  let projectService: ProjectService
  
  let projects = Variable<[Project]>([])
  
  let disposeBag = DisposeBag()
  
  let title = Variable<String>("Title")
  
  
  
  
  // MARK: - Init
  
  init(selectedSegment: Driver<Int>, projectService: ProjectService) {
    print("** ProjectListVM Initialized **")
    self.projectService = projectService
    
    selectedSegment
      .distinctUntilChanged()
      .map { index in
        return index == 0 ? false : true
      }
      .drive(onNext: { [weak self] favorites in
        self?.refreshProjects(favorites: favorites)
      })
      .disposed(by: disposeBag)
    
  }
  
  deinit {
    print("** ProjectListVM Deinitialized **")
  }
  
  
  // MARK: - Computed Properties
  
  var numberOfProjects: Int { return projects.value.count }
  
  
  // MARK: - Methods
  
  func refreshProjects(favorites: Bool) {
    var projectArray = [Project]()
    
    var results = projectService.projects()
    
    if favorites {
      results = results.filter("starred = true")
      title.value = "Favorite Projects"
    } else {
      title.value  = "All Projects"
    }
    
    for project in results {
      projectArray.append(project)
    }
    
    self.projects.value = projectArray
    
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
      return self.projectService.toggleFavorite(project)
    }
    
  }
  
}
