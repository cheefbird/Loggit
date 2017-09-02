//
//  PersistentService.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/30/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift


protocol PersistentService {
  
  func withRealm<T>(_ operation: String, action: (Realm) throws -> T) -> T?
  
}


extension PersistentService {
  
  func withRealm<T>(_ operation: String, action: (Realm) throws -> T) -> T? {
    
    do {
      
      let realm = try Realm()
      return try action(realm)
      
    } catch let error {
      
      print("Failed \(operation) in realm with error: \(error)")
      return nil
      
    }
    
  }
  
}
