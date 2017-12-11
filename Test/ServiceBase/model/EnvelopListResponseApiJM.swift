//
//  EnvelopListResponseApiJM.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import EVReflection


class EnvelopListResponseApiJM <T> : EVObject where T:NSObject
{
    var Result: [T]?
    
    var Version:String?
    var Success:Bool = false
    var ErrorCode:Int = 0
    var StatusCode:Int = 0
    var ErrorMessage:String?
    
    override func setValue(_ value: Any!, forUndefinedKey key: String) {
        
        if(key=="Result"){
            Result = value as? [T] ?? [T]()
        }
    }
}
