//
//  BindableType.swift
//  Loggit
//
//  Created by Francis Breidenbach on 9/7/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit


protocol BindableType {
  
  associatedtype ViewModelType
  
  var viewModel: ViewModelType! { get set }
  
  func bind()
  
}


extension BindableType where Self: UIViewController {
  
  mutating func initWithViewModel(_ vm: Self.ViewModelType) {
    viewModel = vm
    loadViewIfNeeded()
    bind()
  }
  
}
