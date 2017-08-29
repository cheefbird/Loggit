//
//  ProjectListTableViewCell.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/28/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

class ProjectListTableViewCell: UITableViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var companyLabel: UILabel!
  @IBOutlet weak var favoriteButton: UIButton!
  
  
  // MARK: - Lifecycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  
  // MARK: - Methods
  
  func configure() {
    nameLabel.text = "SleepScore Mobile Application That May Not Launch"
    companyLabel.text = "SleepScore Labs"
    
  }
  
}
