//
//  ProjectListViewController.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/22/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

class ProjectListViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
  }
  


}


extension ProjectListViewController: UITableViewDelegate {
  
  
  
}



extension ProjectListViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "StaticCell")
    
    cell.textLabel?.text = "Cell Number \(indexPath.row)"
    cell.detailTextLabel?.text = "This is a subtitle"
    cell.accessoryType = .disclosureIndicator
    
    return cell
    
  }
  
}
