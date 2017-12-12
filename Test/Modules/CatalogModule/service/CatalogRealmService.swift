//
//  CatalogRealmService.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import RealmSwift


class CatalogRealmService :BaseRealmService {
    
   
    
    //MARK:- Catalog Realm Service
    func saveStores(stores:[StoreListJM])
    {
        try! realm.write {
            realm.add(stores)
            
        }
    }
    
    func deletaAllStores()
    {
        try! realm.write {
            realm.delete(getAllStores())
            
            
        }
    }
    
    func getAllStores()->[StoreListJM]
    {
        return  Array(realm.objects(StoreListJM.self))
        
    }
    
    
}

