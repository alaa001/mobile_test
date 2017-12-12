//
//  StoreFilterViewModel.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import  RxSwift

class StoreFilterViewModel:BaseViewModel{
    
    
    //MARK:- RX
    private var filterObservable = Variable<InputParams?>(nil)
    
    
    //MARK:- OutParams
    private  var outParams:OutParams = OutParams()
    
    //MARK:- Services
    private var service : CatalogService
    
    //MARK:- Navigator
    weak var navigator :CatalogNavigator?
    
    
 
    
    
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

            }
            
        }).addDisposableTo(disposeBag)
        
    }
    
    
    
    //MARK:- ViewMethods
    
    
    
    func getTitle() ->String
    {
        return "Store Filter"
    }
    
    
    func getHasSubscription ()->Bool?
    {
        return filterObservable.value?.hasSubscription
    }
    
    func getHighToLowRating ()->Bool?
    {
        return filterObservable.value?.highToLowRating
    }
    
    func getAsscendingMinOrder ()->Bool?
    {
        return filterObservable.value?.asscendingMinOrder
    }
    
    func getOutParams()->OutParams
    {
        return outParams
    }
  
    
    
    func setHasSubscription (value:Bool?)
    {
         filterObservable.value?.hasSubscription = value
    }
    
    func setHighToLowRating  (value:Bool?)
    {
        filterObservable.value?.highToLowRating = value
    }
    
    func setAsscendingMinOrder(value:Bool?)
    {
        filterObservable.value?.asscendingMinOrder = value
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
    
    
    func applyFilter()
    {
        self.outParams.filterObservable.onNext(self.filterObservable.value)
        
    }
    
    
    func clearFilter()
    {
        self.outParams.filterObservable.onNext(InputParams.init())
    }
   
    
    
    //MARK:- InputParams
    class InputParams {
        
        var hasSubscription:Bool? = nil
        var highToLowRating:Bool? = nil
        var asscendingMinOrder:Bool? = nil
        
        
        
        init(
             hasSubscription:Bool? = nil,
             highToLowRating:Bool? = nil,
             asscendingMinOrder:Bool? = nil
            ) {
          
            self.hasSubscription = hasSubscription
            self.highToLowRating = highToLowRating
            self.asscendingMinOrder = asscendingMinOrder

            
        }
        
    }
    
    class OutParams{
        
        var filterObservable:BehaviorSubject<InputParams?> = BehaviorSubject<InputParams?>.init(value: nil)
        
        
    }
    
    
    
}

