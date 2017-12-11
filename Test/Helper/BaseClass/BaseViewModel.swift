//
//  BaseViewModel.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation
import RxSwift


class BaseViewModel {
    
    
    //MARK:- RX
    
    var showLoading = BehaviorSubject(value: false)
    var updateViewWithData  = BehaviorSubject(value: false)
    var requestDidFail = BehaviorSubject(value: false)
    
    var errorObservable = Variable<String?>(nil)
    var infoObservable = Variable<String?>(nil)
    var successObservable = Variable<String?>(nil)
    var confirmObservable = Variable<String?>(nil)
    
    
    
    var disposeBag = DisposeBag()
    
    init() {
        
    }
    
    func prepareRXforReuse()
    {
        showLoading.onNext(false)
        updateViewWithData.onNext(false)
        requestDidFail.onNext(false)
        errorObservable.value = nil
        infoObservable.value = nil
        successObservable.value = nil
        
    }
    
    func showRequestDidError (msg:String?)
    {
        if let error = msg
        {
            self.errorObservable.value = error
            
        }
        else {
            self.errorObservable.value = "Can not connect to server, Please check your internet connection"
        }
        
        self.requestDidFail.onNext(false)
    }
}
