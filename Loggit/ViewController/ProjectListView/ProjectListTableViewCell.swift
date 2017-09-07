//
//  ProjectListTableViewCell.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/28/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import RxSwift
import Action

class ProjectListTableViewCell: UITableViewCell {
  
  // MARK: - Properties
  
  var disposeBag = DisposeBag()
  
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
  
  
  override func prepareForReuse() {
    favoriteButton.rx.action = nil
    disposeBag = DisposeBag()
    super.prepareForReuse()
  }
  
  
  // MARK: - Methods
  
  func configure(usingProject project: Project, toggleAction: CocoaAction) {
    
    favoriteButton.rx.action = toggleAction
    
    nameLabel.text = project.name
    companyLabel.text = project.companyName
    
    project.rx.observe(Bool.self, "starred")
      .subscribe(onNext: { [weak self] isFavorite in
        self?.favoriteButton.isSelected = isFavorite!
      })
      .disposed(by: disposeBag)
    
  }
  
  

  
  
  func empty() { 
    nameLabel.text = "North Korean Rocket Skates"
    companyLabel.text = "ACME Corporation"
  }

  
}
