//
//  ItemViewModel.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation

class ItemViewModel {
    
    var model:StoreItemJM
    
    init(model:StoreItemJM) {
        self.model = model
    }
    
    
    func getId()->Int{
        return model.id
    }
    
    func getName()->String{
    
        return model.name!
    }
    
    func getImageUrl()->String?
    {
        return  model.imageUrl?.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
    }
    
    func getService1Price()->Double
    {
        return model.service1
    }
    
    func getService2Price()->Double
    {
        return model.service2
    }
    
    func getService3Price()->Double
    {
        return model.service3
    }
    
    func getPriceList()->[Double]
    {
        return [model.service1,model.service2,model.service3]
    }
    

}
