//
//  Networking.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import RxSwift

protocol Networking {
    
    func jsonGet(url:String,headers:[String:String]?)->Observable<(HTTPURLResponse, Any)>
    
    func jsonPost(url:String,parameters:[String:Any]?,headers:[String:String]?)->Observable<(HTTPURLResponse, Any)>
    
    func jsonPut(url:String,parameters:[String:Any]?,headers:[String:String]?)->Observable<(HTTPURLResponse, Any)>
    
    func jsonDelete(url:String,headers:[String:String]?)->Observable<(HTTPURLResponse, Any)>
    
}
