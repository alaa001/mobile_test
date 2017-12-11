//
//  CatalogService.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import RxSwift

class CatalogService {
   
    private var api:CatalogRestApi
    private var dbService:CatalogRealmService
    
    let disposeBag = DisposeBag()
    
    init (apiService:CatalogRestApi,
          databaseService:CatalogRealmService)
    {
        api = apiService
        dbService = databaseService
        
    }
    
    
    
    func getStoreList() -> Observable<(Bool, EnvelopListResponseApiJM<StoreListJM>?)>
    {
        
     return Observable<(Bool, EnvelopListResponseApiJM<StoreListJM>?)>.create( { x -> Disposable in

        self.api.getStorList().subscribeOn(MainScheduler.instance)
            .subscribe(onNext: { (response, data) in
                
                let envelopResult = EnvelopListResponseApiJM<StoreListJM>()
                
                var storeResult:[StoreListJM] = []
                
                if let dictArray = data as? [Any]
                {
                    for  item in dictArray
                    {
                        let storeList = StoreListJM(dictionary: (item as! NSDictionary))
                        storeResult.append(storeList)
                    }
                }
                
                envelopResult.Result = storeResult

                
                if(response.statusCode == 200)
                {
                    x.onNext((true,envelopResult))
                    
                }
                else
                {
                    x.onNext((false,envelopResult))
                }
                
                x.onCompleted()
                
                
            }, onError: { error in
                
                
                x.onNext((false,nil))
                x.onCompleted()
                
            }).addDisposableTo(self.disposeBag)
            
            
            return Disposables.create()
        })
        
        
        
    }

    
    
    func getStoreItems(storeId:Int) -> Observable<(Bool, EnvelopListResponseApiJM<StoreItemJM>?)>
    {
        
        return Observable<(Bool, EnvelopListResponseApiJM<StoreItemJM>?)>.create( { x -> Disposable in
            
            self.api.getStorItem(storeId: storeId).subscribeOn(MainScheduler.instance)
                .subscribe(onNext: { (response, data) in
                    
                    let envelopResult = EnvelopListResponseApiJM<StoreItemJM>()
                    
                    var storeResult:[StoreItemJM] = []
                    
                    if let dictArray = data as? [Any]
                    {
                        for  item in dictArray
                        {
                            let storeList = StoreItemJM(dictionary: (item as! NSDictionary))
                            storeResult.append(storeList)
                        }
                    }
                    
                    envelopResult.Result = storeResult
                    
                    
                    if(response.statusCode == 200)
                    {
                        x.onNext((true,envelopResult))
                        
                    }
                    else
                    {
                        x.onNext((false,envelopResult))
                    }
                    
                    x.onCompleted()
                    
                    
                }, onError: { error in
                    
                    
                    x.onNext((false,nil))
                    x.onCompleted()
                    
                }).addDisposableTo(self.disposeBag)
            
            
            return Disposables.create()
        })
        
        
        
    }
    
    
    
    
//
//    func saveSelectedArea(area:AreaModelJM)
//    {
//        let selectedArea = SelectedAreaModel()
//        selectedArea.Id = area.Id
//        selectedArea.Name = area.Name
//        selectedArea.AddressId = area.AddressId
//        selectedArea.Polygons = area.Polygons
//
//        dbService.deleteSelectedArea()
//        dbService.saveSelectedArea(areaModel: selectedArea)
//
//    }
//
//
//
//    func getSelectedArea()->AreaModelJM?
//    {
//        if let savedAddress = dbService.getSelectedAddress()
//        {
//            let areaMapped = AreaModelJM()
//            areaMapped.Id = savedAddress.Id
//            areaMapped.Name = savedAddress.Name
//            areaMapped.AddressId = savedAddress.AddressId
//            areaMapped.Polygons = savedAddress.Polygons
//            return areaMapped
//        }
//
//        return nil
//
//    }
    
    
    
    
    
}
