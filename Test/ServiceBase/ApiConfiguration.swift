//
//  ApiConfiguration.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation


class ApiConfiguration
{
    
    private let isProduction = !Constants.App.isDebug
    
    private let BASEURL_LIVE = "https://5a12745f748faa001280a746.mockapi.io/v1/"
    private let BASEURL_DEMO = "https://5a12745f748faa001280a746.mockapi.io/v1/"
    
    private let BASEURL_IMAGES_LIVE = "https://5a12745f748faa001280a746.mockapi.io/v1/"
    private let BASEURL_IMAGES_DEMO = "https://5a12745f748faa001280a746.mockapi.io/v1/"
    
    private let STATIC_BASE_URL_LIVE = ""
    private let STATIC_BASE_URL_DEMO = ""
    
    
    
    func getBaseURL() -> String {
        if(isProduction)
        {
            return BASEURL_LIVE
        }
        else
        {
            return BASEURL_DEMO
        }
    }
    
    func getImagesURL()->String {
        if(isProduction)
        {
            return BASEURL_IMAGES_LIVE
        }
        else
        {
            return BASEURL_IMAGES_DEMO
        }
        
        
    }
    
    
    func getStaticBaseURL()->String
    {
        if(isProduction)
        {
            return STATIC_BASE_URL_LIVE
            
        }
        else
        {
            return STATIC_BASE_URL_DEMO
            
        }
    }
    
    
    
    
    
    
}
