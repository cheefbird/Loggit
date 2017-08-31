//
//  ProjectListViewController.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/22/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProjectListViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  
  
  // MARK: - Properties
  
  var projects: [Project] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  var viewModel: ProjectListViewViewModel!
  
  let disposeBag = DisposeBag()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel = ProjectListViewViewModel()
    
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    navigationController?.navigationBar.shadowImage = UIImage()
    
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 60
    
    viewModel.projects
      .subscribe(onNext: { [weak self] projects in
        self?.projects = projects
      })
      .disposed(by: disposeBag)
    
  }
  
  
  // MARK: - Methods
  
  
  
}


extension ProjectListViewController: UITableViewDelegate {
  
  
  
  
  
}



extension ProjectListViewController: UITableViewDataSource {
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return projects.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as! ProjectListTableViewCell
    
    cell.configure(usingProject: projects[indexPath.row])
    
    return cell
    
  }
  
}
