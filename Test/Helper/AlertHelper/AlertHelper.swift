//
//  AlertHelper.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation


enum AlertType
{
    case info
    case error
    case warning
    case standard
    case custom
}

class AlertHelper
{
    
    static func showAlert(title:String , subTitle:String,type:AlertType,callBack:@escaping ()->Void)
    {

        
    }
    
    
    
    static func showConfirmAlert(title:String ,subTitle:String,confirmBtnTitle:String, destructiveBtnTitle:String,type:AlertType,postiveCallBack:@escaping ()->Void,negativeCallback:@escaping ()->Void)
    {

        
    }
    
    
    
    
}
