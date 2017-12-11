//
//  StoreListViewModel.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import RxSwift


class StoreListViewModel :BaseViewModel{
    
    
    //MARK:- RX
    private var filterObservable = Variable<InputParams?>(nil)
    
    var showFilterIndication:BehaviorSubject<Bool> = BehaviorSubject.init(value: false)
    
    
    
    
    //MARK:- Services
    private var service : CatalogService
    
    //MARK:- Navigator
    weak var navigator :CatalogNavigator?
    
    
    //MARK:- Models
    private var modelList:[StoreListItemViewModel] = []
    
    private var orgModelList:[StoreListItemViewModel] = []
    
    
    
    
    
    
    
    //MARK:- Constructor
    init(service:CatalogService)
    {
        self.service = service
      
        
        super.init()
        
        
        binding()
        
        
    }
    
    
    //MARK:- Binding
    
    func binding()
    {
        
        self.filterObservable.asObservable().subscribe(onNext: { (filter) in
            
            if let _ = filter
            {
                self.getStoresList(filter:filter!)
            }
            
        }).addDisposableTo(disposeBag)
        
    }
    
    
    
    //MARK:- ViewMethods
    
    
    
    func getTitle() ->String
    {
        return "Store List"
    }
    
    
    func getStoreCount()->Int
    {
        return modelList.count
    }
    
    func getStoreItemViewModel(index:Int)-> StoreListItemViewModel
    {
        return modelList[index]
    }
    
    //MARK:-  SearchFilter
    
    
    func setFilter(filter:InputParams)
    {
        self.filterObservable.value = filter
        
    }
    
    func getFilter() -> Variable<InputParams?>
    {
        return filterObservable
    }
    
    
    
    //MARK:- Select Restaurant
    func selectStore(index:Int)
    {
        let selectedStore = modelList[index]
        
        navigator?.showStoreDetails(storeId: selectedStore.getId())
    
        
    }
    
    func showStoreFilter()
    {
        //let filterInput = getFilterInputObject()
        
//        self.navigator?.showRestaurnatFilter(filter:filterInput , callBack:{ [unowned self] restaurantFilter in
//
//            restaurantFilter.filterObservable.subscribe(onNext: { [unowned self](filterValue) in
//
//
//                if let filter = filterValue
//                {
//
//                    self.checkifItsClear(filter: filter)
//                    self.setSearchFilter(inputfilter: filter)
//                }
//
//            }).addDisposableTo(self.disposeBag)
//
//        })
    }
    
    
//    private func checkifItsClear(filter:RestaurantFilterViewModel.InputParams )
//    {
//
//
//    }
//
//    private func getFilterInputObject() ->RestaurantFilterViewModel.InputParams
//    {
//
//        return inputFilter
//
//    }
    
    
    // MARK:- Call WebService
    
    func getStoresList(filter:InputParams)
    {
        showLoading.onNext(true)
        
        
        
        service.getStoreList()
            .subscribe(onNext: { (success,data) in
                
                self.showLoading.onNext(false)
                
                if(success)
                {
                    
                    self.modelList.removeAll()
                    
                    for modelJm in (data?.Result)!
                    {
                        self.modelList.append(StoreListItemViewModel(model: modelJm))
                        
                    }
                    
                    self.orgModelList = Array(self.modelList)
                    
                    self.updateViewWithData.onNext(true)
                    
                    
                }
                else{
                    
                    self.showRequestDidError(msg: data?.ErrorMessage)
                    
                }
                
            }).addDisposableTo(disposeBag)
        
        
        
    }
    
   
    
    
    //MARK:- Cart
    func showCart()
    {
        
        //self.navigator?.showCart(typeId: (self.filterObservable.value?.typeId)!)
        
    }
    
    
    //MARK:- Search
    
    func searchList(keyword:String)
    {
        
        self.modelList = self.orgModelList.filter{ list in
            
            return list.getStoreName()!.lowercased().contains(keyword.lowercased())
            
        }
        
        if(keyword == ""){
            self.modelList = self.orgModelList
        }
        
        self.updateViewWithData.onNext(true)
        
        
    }
    
    
    
    //MARK:- InputParams
    class InputParams {
        
       
        
        init(
            ) {
            
           
            
        }
        
    }
    
    
    
}

