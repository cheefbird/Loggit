//
//  ProjectListTableViewCell.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/28/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProjectListTableViewCell: UITableViewCell {
  
  // MARK: - Properties
  
  var project: Project?
  
  let disposeBag = DisposeBag()
  
  // MARK: - Outlets
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var companyLabel: UILabel!
  @IBOutlet weak var favoriteButton: UIButton!
  
  
  // MARK: - Actions
  
//  @IBAction func toggleFavorite() {
//    favoriteButton.isSelected = !favoriteButton.isSelected
//  }
  
  
  // MARK: - Lifecycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  
  // MARK: - Methods
  
  func configure(usingProject project: Project) {
    self.project = project
    nameLabel.text = project.name
    companyLabel.text = project.companyName
    favoriteButton.isSelected = project.starred
    
    favoriteButton.rx.tap
      .subscribe(onNext: {
        self.toggleFavorite()
      })
      .disposed(by: disposeBag)
  }
  
  
  private func toggleFavorite() {
    if let project = project {
      project.starred = !project.starred

    }
    favoriteButton.isSelected = !favoriteButton.isSelected
  }
  
  
  func empty() { 
    nameLabel.text = "North Korean Rocket Skates"
    companyLabel.text = "ACME Corporation"
  }

  
}
