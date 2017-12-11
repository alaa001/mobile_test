//
//  ActivityLoader.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import NVActivityIndicatorView


class ActivityLoaderHelper{
    
    static func showLoading()
    {
        let activityData = ActivityData(type: .ballScaleRippleMultiple,
                                        backgroundColor : UIColor.init(hexString: "000000", transparency: 0.2)
            
            
        );
        
        
        
        
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        
        
    }
    
    
    static func hideLoading()
    {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
    
    
}

extension UIViewController {
    
    func showLoading(){
        ActivityLoaderHelper.showLoading()
    }
    
    func hideLoading()
    {
        ActivityLoaderHelper.hideLoading()
    }
    
}
