//
//  StoreDetailsViewModel.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation

import RxSwift


class StoreDetailsViewModel :BaseViewModel{
    
    
    //MARK:- RX
    private var filterObservable = Variable<InputParams?>(nil)
    
    var  cartCount:Variable<Int> = Variable.init(0)
    
    
    //MARK:- Services
    private var service : CatalogService
    
    //MARK:- Navigator
    weak var navigator :CatalogNavigator?
    
    
    //MARK:- Models
    private var modelList:[ItemViewModel] = []
    
    private var orgModelList:[ItemViewModel] = []
    
    
    
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
                self.getStoreItems(filter:filter!)
            }
            
        }).addDisposableTo(disposeBag)
        
    }
    
    
    
    //MARK:- ViewMethods
    
    
    
    func getTitle() ->String
    {
        return "Store Details"
    }
    
    
    func getStoreCount()->Int
    {
        return modelList.count
    }
    
    func getItemViewModel(index:Int)-> ItemViewModel
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
    func selectItem(index:Int)
    {
        
    }

    // MARK:- Call WebService
    
    func getStoreItems(filter:InputParams)
    {
        showLoading.onNext(true)
        
        service.getStoreItems(storeId: filter.storeId)
            .subscribe(onNext: { (success,data) in
                
                self.showLoading.onNext(false)
                
                if(success)
                {
                    
                    self.modelList.removeAll()
                    
                    for modelJm in (data?.Result)!
                    {
                        self.modelList.append(ItemViewModel(model: modelJm))
                        
                    }
                    
                    self.orgModelList = Array(self.modelList)
                    
                    self.updateViewWithData.onNext(true)
                    
                    
                }
                else{
                    
                    self.showRequestDidError(msg: data?.ErrorMessage)
                    
                }
                
            }).addDisposableTo(disposeBag)
        
        
        
    }
    
    func goBackToStoreList()
    {
      let selectedItems =   modelList.filter{ x in
            return x.serviceSelected != nil
            
        }
        
        if(selectedItems.count > 0) // show confirm msg to clear cart
        {
            confirmObservable.value = "Are you sure that you want to clear the cart and go back to store list"
            return
        }
        
        navigator?.popToStoreList()
    
    }
    
    func clearCart()
    {
        let selectedItems =   modelList.filter{ x in
            return x.serviceSelected != nil
            
        }
        
        for item in selectedItems
        {
            item.setServiceSelected(serviceType: nil)
        }
        
        goBackToStoreList()
    }
    
    
    //MARK:- Cart
    func showCart()
    {
        //self.navigator?.showCart(typeId: (self.filterObservable.value?.typeId)!)
    }
    
    
    //MARK:- Search
    
    func searchList(keyword:String)
    {
        
    }
    
    
    
    //MARK:- InputParams
    class InputParams {
        
        var storeId:Int = 0
        
        init(
            storeId:Int
            ) {
            self.storeId = storeId
            
        }
        
    }
    
    
    
}

