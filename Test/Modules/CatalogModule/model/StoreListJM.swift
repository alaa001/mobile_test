//
//  StoreListJM.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import EVReflection
import RealmSwift


/*
 "id": "1",
 "createdAt": 1511163287,
 "name": "Store XYZ1",
 "imageUrl": "https://unsplash.it/600?image=1",
 "areaId": "1",
 "hasSubscription": false,
 "rating": "4.1",
 "email": "first1@mail.com",
 "isActive": false,
 "isTrackingEnabled": false,
 "hasSpecialsServices": false,
 "hasNormalServices": false,
 "minOrderAmount": 2
 */

class StoreListJM : Object, EVReflectable{
  
    
    dynamic var id:Int = 0
    dynamic var name:String?
    dynamic var imageUrl:String?
    dynamic var areaId:Int = 0
    dynamic var createdAt:Double = 0
    dynamic var hasSubscription:Bool = false
    dynamic var rating:Float = 0
    dynamic var email:String?
    dynamic var isActive:Bool = false
    dynamic var isTrackingEnabled:Bool = false
    dynamic var hasSpecialsServices:Bool = false
    dynamic var hasNormalServices:Bool = false
    dynamic var minOrderAmount:Double = 0


    
    
    override static func primaryKey() -> String? {
            return "id"
    
    }
    
    open override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
}
