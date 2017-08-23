//
//  TeamworkRouter.swift
//  Loggit
//
//  Created by Francis Breidenbach on 8/22/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import Alamofire



enum TeamworkRouter: URLRequestConvertible {
  
  
  // MARK: - Cases
  case getProjects
  case getProject(Int)
  
  
  // MARK: - Computed Properties
  private var requestUrl: URL {
    switch self {
      
    case .getProjects:
      return TeamworkService.shared.baseURL.appendingPathComponent("/projects.json")
      
    case .getProject(let id):
      return TeamworkService.shared.baseURL.appendingPathComponent("/projects/\(id).json")
    }
  }
  
  
  private var method: HTTPMethod {
    return .get
  }
  
  
  private var headers: HTTPHeaders {
    var tempHeaders = HTTPHeaders()
    
    let authKey = encode(apiKey: TeamworkService.shared.savedKey)
    
    tempHeaders["Authorization"] = "Basic \(authKey)"
    
    return tempHeaders
    
  }
  
  
  private var parameters: Parameters {
    var params = Parameters()
    
    switch self {
    default:
      params["includePeople"] = true
    }
    
    return params
    
  }
  
  
  // MARK: - Methods
  func asURLRequest() throws -> URLRequest {
    
    var urlRequest = URLRequest(url: requestUrl)
    urlRequest.httpMethod = method.rawValue
    
    urlRequest.allHTTPHeaderFields = headers
    
    let encoding = URLEncoding.default
    
    return try! encoding.encode(urlRequest, with: parameters)
    
  }
  
}



// MARK: - Key Encoder
extension TeamworkRouter {
  
  fileprivate func encode(apiKey key: String) -> String {
    
    guard let encodedKey = key.appending(":fuckthisjob").data(using: .utf8)?.base64EncodedString()
      else {
        fatalError("Failed to encode API key. Exiting ...")
    }
    
    return encodedKey
  }
  
}
