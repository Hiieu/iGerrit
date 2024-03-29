//
//  routing.swift
//  iGerrit
//
//  Created by Hieu Doan on 28/10/2016.
//  Copyright © 2016 hdoan. All rights reserved.
//


import Alamofire
import Foundation
import SwiftyJSON



let loginRequest = [
    "username" : "hdoan",
    "password" : "qE8XKcCUEX6l"
]

enum Router: URLRequestConvertible {
    case search(query: String, page: Int)
    case changes(items: Int?)
    case Get(Int)
    case Create([String: AnyObject])
    case Delete(Int)
    
    static let baseURLString = "https://gerrit.bluesoft.net.pl/a/"
    static let itemPerPage = 25
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let result: (path: String, parameters: Parameters) = {
            switch self {
            case let .changes(item):
                return ("changes/", ["n":item ?? Router.itemPerPage])
            case let .search(query, page) where page > 0:
                return ("search", ["q": query, "offset": Router.itemPerPage * page])
            case let .search(query, _):
                return ("search", ["q": query])
            default:
                return ("jj", ["aa":"dd"])
            }
        }()
        
        let url = try Router.baseURLString.asURL()
        let urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
        
        return try URLEncoding.default.encode(urlRequest, with: result.parameters)
    }
}


class GerritResource: NSObject {
    var resp: JSON = [:]
    func callResource(routerMethod: Router) -> Any {
        Alamofire.request(routerMethod)
            .validate()
            .authenticate(user: loginRequest["username"]!, password: loginRequest["password"]!)
            .responseString { response in print(response)
                if let status = response.response?.statusCode {
                    //to get status code
                    print(status)
                }
                var result = response.result.value!
                let GERRIT_PREFIX = ")]}'"
                if (result.hasPrefix(GERRIT_PREFIX)){
                    // Remove prefix from response
                    let startIndex = result.index(result.startIndex, offsetBy: GERRIT_PREFIX.characters.count)
                    result = result.substring(from: startIndex)
                }
                if let data = (result as String).data(using: String.Encoding.utf8) {
                    self.resp = JSON(data: data)
                    print("parsed to json")
                }
                
        }
     return resp
    }
    
}


