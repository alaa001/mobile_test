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
    
    private var storeFilterInputParam = Variable<StoreFilterViewModel.InputParams>(StoreFilterViewModel.InputParams())
    
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
        

        self.getStoresList()
     
        
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
        let filterInput = getFilterInputObject()
        
        self.navigator?.showStoreFilter(filter:filterInput , callBack:{ [unowned self] restaurantFilter in

            restaurantFilter.filterObservable.subscribe(onNext: { [unowned self](filterValue) in


                if let filter = filterValue
                {

                    self.checkifItsClear(filter: filter)
                    self.setSearchFilter(inputfilter: filter)
                }

            }).addDisposableTo(self.disposeBag)

        })
    }
    
    private func setSearchFilter(inputfilter:StoreFilterViewModel.InputParams?)
    {
        
       if let subscription = storeFilterInputParam.value.hasSubscription
       {
            self.modelList = self.orgModelList.filter{ list in
                
                return list.hasSubscription() == subscription
                
            }
        
       }
        
        
        if let asscendingMinOrder = storeFilterInputParam.value.asscendingMinOrder
        {
            if(asscendingMinOrder)
            {
                self.modelList = self.orgModelList.sorted(by: { (x, y) -> Bool in
                    x.getMinOrderAmount() < y.getMinOrderAmount()
                })
            }
            else{
                
                self.modelList = self.orgModelList.sorted(by: { (x, y) -> Bool in
                    x.getMinOrderAmount() > y.getMinOrderAmount()
                })
            }
            
        }
        
        
        if let highToLowRating = storeFilterInputParam.value.highToLowRating
        {
            if(highToLowRating)
            {
                self.modelList = self.orgModelList.sorted(by: { (x, y) -> Bool in
                    x.getRating() > y.getRating()
                })
            }
            else{
                
                self.modelList = self.orgModelList.sorted(by: { (x, y) -> Bool in
                    x.getRating() < y.getRating()
                })
            }
            
        }
        
        updateViewWithData.onNext(true)
    }
    
    private func checkifItsClear(filter:StoreFilterViewModel.InputParams )
    {


    }

    private func getFilterInputObject() ->StoreFilterViewModel.InputParams
    {

        return storeFilterInputParam.value

    }
    
    
    // MARK:- Call WebService
    
    func getStoresList()
    {
        
        
        
        if let savedStores = service.getCachedData()
        {
            self.modelList.removeAll()
            
            for modelJm in savedStores
            {
                self.modelList.append(StoreListItemViewModel(model: modelJm))
                
            }
            
            self.orgModelList = Array(self.modelList)
            
            self.updateViewWithData.onNext(true)
            
            
        }
        else{
          showLoading.onNext(true)
        }
        /// even though I got cached data, I will get the request for new data and save it with showing any loading UI
        
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

