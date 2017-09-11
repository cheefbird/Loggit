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
  
  var viewModel: ProjectListViewViewModel!
  
  let disposeBag = DisposeBag()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 60
    setupNavBar()
    
    // TODO: Need to refactor this out to delegate or coordinator. Should not be creating this in VC.
    viewModel = ProjectListViewViewModel(selectedSegment: segmentedControl.rx.selectedSegmentIndex.asDriver(), projectService: ProjectService())
    
    viewModel.projects.asDriver()
      .drive(onNext: { [weak self] _ in
        self?.tableView.reloadData()
        debugPrint(RxSwift.Resources.total)
      })
      .disposed(by: disposeBag)
    
    viewModel.title.asDriver()
      .drive(onNext: { [weak self] title in
        self?.title = title
      })
      .disposed(by: disposeBag)
  }
  
  
  // MARK: - Setup View
  
  private func setupNavBar() {
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    navigationController?.navigationBar.shadowImage = UIImage()
  }
  
  
  
}


extension ProjectListViewController: UITableViewDelegate {
  
  
  
  
  
}



extension ProjectListViewController: UITableViewDataSource {
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    guard viewModel.numberOfProjects > 0 else { return 1 }
    return viewModel.numberOfProjects
    
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as! ProjectListTableViewCell
    
    guard let project = viewModel.project(at: indexPath.row) else {
      cell.empty()
      return cell
    }
    
    cell.configure(usingProject: project, toggleAction: viewModel.toggleFavorite(project))
    
    return cell
    
  }
  
}
