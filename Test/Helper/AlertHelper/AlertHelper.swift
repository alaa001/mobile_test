//
//  AlertHelper.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import UIKit


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
    
    static func showAlert(title:String , subTitle:String,type:AlertType,callBack:@escaping ()->Void,controller:UIViewController? = nil)
    {

        let alertController = UIAlertController(title: "Hey AppCoda", message: "What do you want to do?", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        controller?.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    static func showConfirmAlert(title:String ,subTitle:String,confirmBtnTitle:String, destructiveBtnTitle:String,type:AlertType,postiveCallBack:@escaping ()->Void,negativeCallback:@escaping ()->Void,controller:UIViewController? = nil)
    {

        let alertController = UIAlertController(title: "Note", message: subTitle, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "YES", style: .default,handler:{action in
            postiveCallBack()
            
        })
        
        alertController.addAction(defaultAction)
        
        let noAction = UIAlertAction(title: "NO", style: .default, handler: {action in
            negativeCallback()
        })
        alertController.addAction(noAction)
        
        
        controller?.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    
}
