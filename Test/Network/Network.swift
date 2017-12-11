//
//  Network.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift


class Network : Networking {
    
    
    func jsonGet(url:String,headers:[String:String]?)->Observable<(HTTPURLResponse, Any)>{
        
        return requestJSON(.get, URL(string: url)!, parameters: nil, encoding: JSONEncoding.default, headers: headers).observeOn(MainScheduler.instance)
        
    }
    
    func jsonPost(url:String,parameters:[String:Any]?,headers:[String:String]?)->Observable<(HTTPURLResponse, Any)>{
        
        return requestJSON(.post, URL(string: url)!, parameters: parameters, encoding: JSONEncoding.default, headers: headers).observeOn(MainScheduler.instance)
        
    }
    
    func jsonPut(url:String,parameters:[String:Any]?,headers:[String:String]?)->Observable<(HTTPURLResponse, Any)>{
        
        return requestJSON(.put, URL(string: url)!, parameters: parameters, encoding: JSONEncoding.default, headers: headers).observeOn(MainScheduler.instance)
        
    }
    
    func jsonDelete(url:String,headers:[String:String]?)->Observable<(HTTPURLResponse, Any)>{
        
        return requestJSON(.delete, URL(string: url)!, parameters: nil, encoding: JSONEncoding.default, headers: headers).observeOn(MainScheduler.instance)
        
    }
}
