//
//  UIViewControllerHelpers.swift
//  Loggit
//
//  Created by Francis Breidenbach on 9/2/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit


extension UIViewController {
  
  func displayAlert(title: String, message: String?, alertAction: ((UIAlertAction) -> Void)? = nil) {
    
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let actionText = (alertAction != nil) ? "OK" : "Dismiss"
    let action = UIAlertAction(title: actionText, style: .default, handler: alertAction)
    
    controller.addAction(action)
    
    self.present(controller, animated: true)
    
  }
  
}
