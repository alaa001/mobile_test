//
//  BaseRemoteService.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation

import EVReflection


class BaseRemoteService {
    
    
    
    
    func serializeDeserialzeBody(_ object:EVObject)->(Dictionary<String, Any>,String?)
    {
        let dataDic = NSMutableDictionary(json: object.toJsonString()) as! [String : Any]
        let jsonData = try? JSONSerialization.data(withJSONObject: dataDic, options: JSONSerialization.WritingOptions())
        let jsonString = String(data: jsonData!, encoding:.utf8)
        
        return (dataDic,jsonString)
        
    }
    
}
