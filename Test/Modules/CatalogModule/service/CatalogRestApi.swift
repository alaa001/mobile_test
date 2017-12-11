//
//  CatalogRestApi.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import RxSwift

class CatalogRestApi: BaseRemoteService , ApiResourceDataSource{
    
    
    let networking:Networking
    let apiConfig:ApiConfiguration
    
    
    init(network:Networking,
    apiConfiguration:ApiConfiguration
        )
    {
        networking = network
        apiConfig = apiConfiguration
        
    }
    
    func getBaseResourceURL()->String
    {
        return "stores/"
    }
    
    func getStorList() -> Observable<(HTTPURLResponse, Any)>
    {
        let urlString = apiConfig.getBaseURL() + getBaseResourceURL() + "storelist"
        
        return networking.jsonGet(url: urlString, headers:nil)
        
    }
    
    
    func getStorItem(storeId:Int) -> Observable<(HTTPURLResponse, Any)>
    {
        let urlString = apiConfig.getBaseURL() + getBaseResourceURL() + "item"
        
        return networking.jsonGet(url: urlString, headers:nil)
        
    }
    
   
    
}

