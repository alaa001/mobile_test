//
//  StoreListItemViewModel.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation

class StoreListItemViewModel {
    
    
    var model:StoreListJM
    
    init(model:StoreListJM) {
        self.model = model
    }
    
    func getId()->Int{
        return model.id
    }
    
    func getStoreName()->String?
    {
        return model.name
    }
    
    func getImageUrl()->String?
    {
        return  model.imageUrl?.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
    }
    
    func hasSubscription()->Bool
    {
        return model.hasSubscription
    }
    
    func getRating()->Float
    {
        return model.rating
    }
    
    

    func isActive()->Bool
    {
        return model.isActive
    }
    func isTrackingEnabled()->Bool
    {
        return model.isTrackingEnabled
    }
    
    
    func hasSpecialsServices()->Bool
    {
        return model.hasSpecialsServices
    }
    
    func hasNormalServices()->Bool
    {
        return model.hasNormalServices
    }
    
    func getMinOrderAmount()->Double{
        return model.minOrderAmount
    }
    
  
    
}
